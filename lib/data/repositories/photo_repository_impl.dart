import 'package:awesome_app/data/datasources/remote_datasource.dart';
import 'package:awesome_app/domain/entities/photo_entity.dart';
import 'package:awesome_app/domain/entities/photo_list_entity.dart';
import 'package:awesome_app/domain/repositories/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final RemoteDataSource remoteDataSource;

  PhotoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<PhotoListEntity> getCuratedPhotos(int page) async {
    try {
      final photos = await remoteDataSource.fetchCuratedPhotos(page);
      return photos;
    } catch (error) {
      throw Exception('Failed to fetch photos: $error');
    }
  }

  @override
  Future<PhotoEntity> getPhotoDetail(int id) async {
    try {
      final photo = await remoteDataSource.fetchPhotoDetail(id);
      return photo;
    } catch (error) {
      throw Exception('Failed to fetch photo detail: $error');
    }
  }
}
