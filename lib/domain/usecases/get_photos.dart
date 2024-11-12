import 'package:injectable/injectable.dart';
import '../entities/photo.dart';
import '../repositories/photo_repository.dart';

@injectable
class GetPhotosUseCase {
  final PhotoRepository _repository;

  GetPhotosUseCase(this._repository);

  Future<List<Photo>> call({int page = 1, int perPage = 5}) {
    return _repository.getPhotos(page: page, perPage: perPage);
  }
}
