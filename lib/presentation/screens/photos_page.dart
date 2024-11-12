import 'package:awesome_app/presentation/bloc/photos/photos_bloc.dart';
import 'package:awesome_app/presentation/bloc/photos/photos_event.dart';
import 'package:awesome_app/presentation/bloc/photos/photos_state.dart';
import 'package:awesome_app/presentation/widgets/photo_grid_view.dart';
import 'package:awesome_app/presentation/widgets/photo_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  @override
  void initState() {
    context.read<PhotosBloc>().add(const LoadPhotos(refresh: true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awesome App'),
        actions: [
          BlocBuilder<PhotosBloc, PhotosState>(
            buildWhen: (previous, current) =>
                previous.viewMode != current.viewMode,
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  state.viewMode == ViewMode.grid
                      ? Icons.list
                      : Icons.grid_view,
                ),
                onPressed: () {
                  context.read<PhotosBloc>().add(const ToggleViewMode());
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                final bloc = context.read<PhotosBloc>();
                bloc.add(const LoadPhotos(refresh: true));
              },
              child: BlocBuilder<PhotosBloc, PhotosState>(
                builder: (context, state) {
                  if (state.error != null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.error!),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<PhotosBloc>()
                                  .add(const LoadPhotos(refresh: true));
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  if (state.photos.isEmpty && !state.isLoading) {
                    return const Center(
                      child: Text('No photos found'),
                    );
                  }

                  return state.viewMode == ViewMode.grid
                      ? PhotoGridView(
                          photos: state.photos,
                          isLoading: state.isLoading,
                          hasReachedMax: state.hasReachedMax,
                          onLoadMore: () {
                            final bloc = context.read<PhotosBloc>();
                            bloc.add(const LoadPhotos());
                          },
                        )
                      : PhotoListView(
                          photos: state.photos,
                          isLoading: state.isLoading,
                          hasReachedMax: state.hasReachedMax,
                          onLoadMore: () {
                            final bloc = context.read<PhotosBloc>();
                            bloc.add(const LoadPhotos());
                          },
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
