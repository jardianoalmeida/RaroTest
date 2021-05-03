// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/data_sources/auth/auth_remote_data_source.dart' as _i3;
import '../data/data_sources/feature/feature_local_data_source.dart' as _i11;
import '../data/data_sources/feature/feature_remote_data_source.dart' as _i6;
import '../data/local/hive_client.dart' as _i12;
import '../data/remote/dio_client.dart' as _i7;
import '../data/repositories/auth/auth_repository_impl.dart' as _i5;
import '../data/repositories/feature/feature_repository_impl.dart' as _i15;
import '../domain/repositories/auth/auth_repository.dart' as _i4;
import '../domain/repositories/feature/feature_repository.dart' as _i14;
import '../domain/usecases/auth/LoginUserPassword/LoginUserPassword_use_case.dart'
    as _i8;
import '../domain/usecases/auth/request_new_password_use_case/request_new_password_use_case_use_case.dart'
    as _i9;
import '../domain/usecases/auth/reset_password_use_case/reset_password_use_case_use_case.dart'
    as _i10;
import '../domain/usecases/feature/do_something_use_case.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthRemoteDataSource>(() => _i3.AuthRemoteDataSource());
  gh.factory<_i4.AuthRepository>(
      () => _i5.AuthRepositoryImpl(get<_i3.AuthRemoteDataSource>()));
  gh.factory<_i6.FeatureRemoteDataSource>(
      () => _i6.FeatureRemoteDataSource(get<_i7.DioClient>()));
  gh.factory<_i8.LoginUserPasswordUseCase>(
      () => _i8.LoginUserPasswordUseCase(get<_i4.AuthRepository>()));
  gh.factory<_i9.RequestNewPasswordUseCaseUseCase>(
      () => _i9.RequestNewPasswordUseCaseUseCase(get<_i4.AuthRepository>()));
  gh.factory<_i10.ResetPasswordUseCaseUseCase>(
      () => _i10.ResetPasswordUseCaseUseCase());
  gh.factory<_i11.FeatureLocalDataSource>(
      () => _i11.FeatureLocalDataSource(get<_i12.HiveClient>()));
  gh.factory<_i13.DoSomethingUseCase>(
      () => _i13.DoSomethingUseCase(get<_i14.FeatureRepository>()));
  gh.singleton<_i7.DioClient>(_i7.DioClient());
  gh.singleton<_i12.HiveClient>(_i12.HiveClient());
  gh.singleton<_i14.FeatureRepository>(_i15.FeatureRepositoryImpl(
      get<_i6.FeatureRemoteDataSource>(), get<_i11.FeatureLocalDataSource>()));
  return get;
}
