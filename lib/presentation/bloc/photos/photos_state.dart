import 'package:awesome_app/domain/entities/photo.dart';
import 'package:equatable/equatable.dart';

enum ViewMode { grid, list }

class PhotosState extends Equatable {
  final List<Photo> photos;
  final bool isLoading;
  final String? error;
  final bool hasReachedMax;
  final int currentPage;
  final String? searchQuery;
  final ViewMode viewMode;

  const PhotosState({
    this.photos = const [],
    this.isLoading = false,
    this.error,
    this.hasReachedMax = false,
    this.currentPage = 1,
    this.searchQuery,
    this.viewMode = ViewMode.grid,
  });

  PhotosState copyWith({
    List<Photo>? photos,
    bool? isLoading,
    String? error,
    bool? hasReachedMax,
    int? currentPage,
    String? searchQuery,
    ViewMode? viewMode,
  }) {
    return PhotosState(
      photos: photos ?? this.photos,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
      searchQuery: searchQuery ?? this.searchQuery,
      viewMode: viewMode ?? this.viewMode,
    );
  }

  @override
  List<Object?> get props => [
        photos,
        isLoading,
        error,
        hasReachedMax,
        currentPage,
        searchQuery,
        viewMode,
      ];
}
