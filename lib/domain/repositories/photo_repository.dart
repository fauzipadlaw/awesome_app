import 'package:awesome_app/domain/entities/photo_entity.dart';
import 'package:awesome_app/domain/entities/photo_list_entity.dart';

abstract class PhotoRepository {
  Future<PhotoListEntity> getCuratedPhotos(int page);
  Future<PhotoEntity> getPhotoDetail(int id);
}
