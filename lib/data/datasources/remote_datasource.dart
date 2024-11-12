import '../models/photo_model.dart';

abstract class PhotoRemoteDataSource {
  Future<List<PhotoModel>> getPhotos({int page = 1, int perPage = 20});
}
