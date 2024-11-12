import 'package:awesome_app/data/datasources/remote_datasource.dart';
import 'package:awesome_app/data/models/photo_model.dart';
import 'package:awesome_app/domain/entities/photo.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/photo_repository.dart';

@Injectable(as: PhotoRepository)
class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoRemoteDataSource _remoteDataSource;

  PhotoRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Photo>> getPhotos({int page = 1, int perPage = 20}) async {
    final photoModels = await _remoteDataSource.getPhotos(
      page: page,
      perPage: perPage,
    );
    return photoModels.map((model) => model.toDomain()).toList();
  }
}
