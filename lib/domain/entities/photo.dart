import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final int id;
  final String? url;
  final String? photographer;
  final String? photographerUrl;
  final PhotoSource? src;
  final String? alt;

  const Photo({
    required this.id,
    required this.url,
    this.photographer,
    this.photographerUrl,
    this.src,
    this.alt,
  });

  @override
  List<Object?> get props => [id, url, photographer, photographerUrl, src, alt];
}

class PhotoSource extends Equatable {
  final String? original;
  final String? large;
  final String? medium;
  final String? small;

  const PhotoSource({
    this.original,
    this.large,
    this.medium,
    this.small,
  });

  @override
  List<Object?> get props => [original, large, medium, small];
}
