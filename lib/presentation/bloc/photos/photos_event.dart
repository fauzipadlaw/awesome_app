import 'package:equatable/equatable.dart';

abstract class PhotosEvent extends Equatable {
  const PhotosEvent();

  @override
  List<Object?> get props => [];
}

class LoadPhotos extends PhotosEvent {
  final bool refresh;

  const LoadPhotos({this.refresh = false});

  @override
  List<Object?> get props => [refresh];
}

class ToggleViewMode extends PhotosEvent {
  const ToggleViewMode();
}
