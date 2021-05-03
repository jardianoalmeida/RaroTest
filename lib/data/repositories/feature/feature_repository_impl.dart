import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:raro_test/data/data_sources/feature/feature_local_data_source.dart';
import 'package:raro_test/data/data_sources/feature/feature_remote_data_source.dart';
import 'package:raro_test/domain/repositories/feature/feature_repository.dart';

import 'package:raro_test/data/mappers/index.dart';

/// Every [RepositoryImpl] at Data Layer implements your corresponding [Repository] from Domain layer
/// Retrieve data from databases or other methods through [_localDataSource].
/// Responsible for any API calls through [_remoteDataSource].

@Singleton(as: FeatureRepository)
class FeatureRepositoryImpl implements FeatureRepository {
  final FeatureRemoteDataSource _remoteDataSource;
  final FeatureLocalDataSource _localDataSource;

  FeatureRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<void> doSomething() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
