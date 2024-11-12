import 'package:awesome_app/domain/entities/photo_entity.dart';

class PhotoListEntity {
  final int page;
  final int perPage;
  final List<PhotoEntity> photos;
  final String? nextPage;

  PhotoListEntity({
    required this.page,
    required this.perPage,
    required this.photos,
    this.nextPage,
  });
}
