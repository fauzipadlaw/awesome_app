import 'package:awesome_app/domain/entities/photo.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel extends Equatable {
  final int id;
  final String? url;
  final String? photographer;
  final String? photographerUrl;
  final PhotoSourceModel? src;
  final String? alt;

  const PhotoModel({
    required this.id,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.src,
    this.alt,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);

  @override
  List<Object?> get props => [id, url, photographer, photographerUrl, src, alt];
}

@JsonSerializable()
class PhotoSourceModel extends Equatable {
  final String? original;
  final String? large;
  final String? medium;
  final String? small;

  const PhotoSourceModel({
    this.original,
    this.large,
    this.medium,
    this.small,
  });

  factory PhotoSourceModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoSourceModelFromJson(json);

  @override
  List<Object?> get props => [original, large, medium, small];
}

extension PhotoModelMapper on PhotoModel {
  Photo toDomain() {
    return Photo(
      id: id,
      url: url,
      photographer: photographer,
      photographerUrl: photographerUrl,
      src: PhotoSource(
        original: src?.original,
        large: src?.large,
        medium: src?.medium,
        small: src?.small,
      ),
      alt: alt,
    );
  }
}
