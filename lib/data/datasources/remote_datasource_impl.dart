import 'package:awesome_app/core/network/api_client.dart';
import 'package:awesome_app/data/datasources/remote_datasource.dart';
import 'package:awesome_app/data/models/photo_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PhotoRemoteDataSource)
class PhotoRemoteDataSourceImpl implements PhotoRemoteDataSource {
  final ApiClient _apiClient;

  PhotoRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<PhotoModel>> getPhotos({int page = 1, int perPage = 20}) async {
    final response = await _apiClient.get(
      '/curated',
      params: {
        'page': page,
        'per_page': perPage,
      },
    );

    return (response.data['photos'] as List)
        .map((photo) => PhotoModel.fromJson(photo))
        .toList();
  }

  @override
  Future<List<PhotoModel>> searchPhotos(String query,
      {int page = 1, int perPage = 20}) async {
    final response = await _apiClient.get(
      '/search',
      params: {
        'query': query,
        'page': page,
        'per_page': perPage,
      },
    );

    return (response.data['photos'] as List)
        .map((photo) => PhotoModel.fromJson(photo))
        .toList();
  }
}
