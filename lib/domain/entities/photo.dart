// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final int? id;
  final int? width;
  final int? height;
  final String? url;
  final String? photographer;
  final String? photographerUrl;
  final int? photographerId;
  final String? avgColor;
  final PhotoSource? src;
  final bool? liked;
  final String? alt;

  const Photo({
    this.id,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.src,
    this.alt,
    this.width,
    this.height,
    this.photographerId,
    this.avgColor,
    this.liked,
  });

  @override
  List<Object?> get props => [
        id,
        url,
        photographer,
        photographerUrl,
        src,
        alt,
        width,
        height,
        photographerId,
        avgColor,
        liked,
      ];
}

class PhotoSource extends Equatable {
  final String? original;
  final String? large2x;
  final String? large;
  final String? medium;
  final String? small;
  final String? portrait;
  final String? landscape;
  final String? tiny;

  const PhotoSource({
    this.original,
    this.large2x,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  @override
  List<Object?> get props => [
        original,
        large,
        medium,
        small,
        large2x,
        portrait,
        landscape,
        tiny,
      ];
}
