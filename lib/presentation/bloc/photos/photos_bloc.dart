import 'package:awesome_app/domain/usecases/get_photos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'photos_event.dart';
import 'photos_state.dart';

@injectable
class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final GetPhotosUseCase _getPhotosUseCase;
  static const int _perPage = 10;

  PhotosBloc(
    this._getPhotosUseCase,
  ) : super(const PhotosState()) {
    on<LoadPhotos>(_onLoadPhotos);
    on<ToggleViewMode>(_onToggleViewMode);
  }

  Future<void> _onLoadPhotos(
    LoadPhotos event,
    Emitter<PhotosState> emit,
  ) async {
    if (state.isLoading) return;
    if (state.hasReachedMax && !event.refresh) return;

    try {
      emit(state.copyWith(
        isLoading: true,
        error: null,
        currentPage: event.refresh ? 1 : state.currentPage,
        photos: event.refresh ? [] : state.photos,
      ));

      final photos = await _getPhotosUseCase(
        page: event.refresh ? 1 : state.currentPage,
        perPage: _perPage,
      );

      emit(state.copyWith(
        isLoading: false,
        photos: [...state.photos, ...photos],
        hasReachedMax: photos.length < _perPage,
        currentPage: state.currentPage + 1,
        searchQuery: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  void _onToggleViewMode(
    ToggleViewMode event,
    Emitter<PhotosState> emit,
  ) {
    emit(state.copyWith(
      viewMode: state.viewMode == ViewMode.grid ? ViewMode.list : ViewMode.grid,
    ));
  }
}
