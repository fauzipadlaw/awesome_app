// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => PhotoModel(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String?,
      photographer: json['photographer'] as String?,
      photographerUrl: json['photographerUrl'] as String?,
      src: json['src'] == null
          ? null
          : PhotoSourceModel.fromJson(json['src'] as Map<String, dynamic>),
      alt: json['alt'] as String?,
    );

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'photographer': instance.photographer,
      'photographerUrl': instance.photographerUrl,
      'src': instance.src,
      'alt': instance.alt,
    };

PhotoSourceModel _$PhotoSourceModelFromJson(Map<String, dynamic> json) =>
    PhotoSourceModel(
      original: json['original'] as String?,
      large: json['large'] as String?,
      medium: json['medium'] as String?,
      small: json['small'] as String?,
    );

Map<String, dynamic> _$PhotoSourceModelToJson(PhotoSourceModel instance) =>
    <String, dynamic>{
      'original': instance.original,
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
    };
