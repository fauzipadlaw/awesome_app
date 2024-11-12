// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:awesome_app/domain/entities/photo.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel extends Equatable {
  final int? id;
  final int? width;
  final int? height;
  final String? url;
  final String? photographer;
  final String? photographerUrl;
  final int? photographerId;
  final String? avgColor;
  final PhotoSourceModel? src;
  final bool? liked;
  final String? alt;

  const PhotoModel({
    required this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.avgColor,
    this.src,
    this.liked,
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
  final String? large2x;
  final String? large;
  final String? medium;
  final String? small;
  final String? portrait;
  final String? landscape;
  final String? tiny;

  const PhotoSourceModel({
    this.original,
    this.large2x,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
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
      photographerId: photographerId,
      width: width,
      height: height,
      liked: liked,
      avgColor: avgColor,
      src: PhotoSource(
        original: src?.original,
        large: src?.large,
        medium: src?.medium,
        small: src?.small,
        large2x: src?.large2x,
        landscape: src?.landscape,
        portrait: src?.portrait,
        tiny: src?.tiny,
      ),
      alt: alt,
    );
  }
}
