import '../models/photo_list_model.dart';
import '../models/photo_model.dart';

abstract class RemoteDataSource {
  Future<PhotoListModel> fetchCuratedPhotos(int page);
  Future<PhotoModel> fetchPhotoDetail(int id);
}
