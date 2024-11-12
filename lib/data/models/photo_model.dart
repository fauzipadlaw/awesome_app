import '../../domain/entities/photo_entity.dart';

class PhotoModel extends PhotoEntity {
  PhotoModel({
    required super.id,
    required super.width,
    required super.height,
    required super.url,
    required super.photographer,
    required super.photographerUrl,
    required super.photographerId,
    required super.avgColor,
    required PhotoSrcModel super.src,
    required super.liked,
    required super.alt,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      photographer: json['photographer'],
      photographerUrl: json['photographer_url'],
      photographerId: json['photographer_id'],
      avgColor: json['avg_color'],
      src: PhotoSrcModel.fromJson(json['src']),
      liked: json['liked'],
      alt: json['alt'],
    );
  }
}

class PhotoSrcModel extends PhotoSrcEntity {
  PhotoSrcModel({
    required super.original,
    required super.large2x,
    required super.large,
    required super.medium,
    required super.small,
    required super.portrait,
    required super.landscape,
    required super.tiny,
  });

  factory PhotoSrcModel.fromJson(Map<String, dynamic> json) {
    return PhotoSrcModel(
      original: json['original'],
      large2x: json['large2x'],
      large: json['large'],
      medium: json['medium'],
      small: json['small'],
      portrait: json['portrait'],
      landscape: json['landscape'],
      tiny: json['tiny'],
    );
  }
}
