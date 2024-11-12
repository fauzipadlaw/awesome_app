// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/datasources/remote_datasource.dart' as _i710;
import '../../data/datasources/remote_datasource_impl.dart' as _i616;
import '../../data/repositories/photo_repository_impl.dart' as _i747;
import '../../domain/repositories/photo_repository.dart' as _i236;
import '../../domain/usecases/get_photos.dart' as _i1036;
import '../../presentation/bloc/photos/photos_bloc.dart' as _i858;
import '../network/api_client.dart' as _i557;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.factory<_i557.ApiClient>(() => _i557.ApiClient());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i710.PhotoRemoteDataSource>(
        () => _i616.PhotoRemoteDataSourceImpl(gh<_i557.ApiClient>()));
    gh.factory<_i236.PhotoRepository>(
        () => _i747.PhotoRepositoryImpl(gh<_i710.PhotoRemoteDataSource>()));
    gh.factory<_i1036.GetPhotosUseCase>(
        () => _i1036.GetPhotosUseCase(gh<_i236.PhotoRepository>()));
    gh.factory<_i858.PhotosBloc>(
        () => _i858.PhotosBloc(gh<_i1036.GetPhotosUseCase>()));
    return this;
  }
}

class _$DioModule extends _i464.DioModule {}
