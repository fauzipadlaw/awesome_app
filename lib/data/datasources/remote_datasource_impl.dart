import 'package:awesome_app/core/constants/string.dart';
import 'package:awesome_app/data/datasources/remote_datasource.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../models/photo_list_model.dart';
import '../models/photo_model.dart';

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({
    required this.dio,
  }) {
    dio.options.headers['Authorization'] = apiKey;
    dio.options.baseUrl = baseApi;
  }

  @override
  Future<PhotoListModel> fetchCuratedPhotos(int page) async {
    try {
      final response = await dio.get(
        '/curated',
        queryParameters: {
          'per_page': 10,
          'page': page,
        },
      );
      return PhotoListModel.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to fetch photos: $error');
    }
  }

  @override
  Future<PhotoModel> fetchPhotoDetail(int id) async {
    try {
      final response = await dio.get('/photos/$id');
      return PhotoModel.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to fetch photo detail: $error');
    }
  }
}
