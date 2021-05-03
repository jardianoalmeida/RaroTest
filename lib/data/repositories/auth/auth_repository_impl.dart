import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_snow_base/src/utils/resource.dart';
import 'package:injectable/injectable.dart';
import 'package:raro_test/data/data_sources/auth/auth_remote_data_source.dart';
import 'package:raro_test/domain/entities/user/user_entity.dart';
import 'package:raro_test/domain/repositories/auth/auth_repository.dart';

import 'package:raro_test/data/mappers/index.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  const AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<Resource<UserCredential>>? authenticate(
      {String? username, String? password}) async {
    return await _authRemoteDataSource.signInWithEmailAndPassword(
        username!, password!);
  }

  @override
  Future<Resource<UserEntity>> getUser([bool refresh = false]) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Stream<Resource<UserEntity>> getUserStream() {
    // TODO: implement getUserStream
    throw UnimplementedError();
  }

  @override
  Future<void> logoutUser() {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }

  @override
  Future<Resource<UserEntity>> refreshToken({String? token}) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<Resource<UserEntity>> registerUserPassword(
      String email, String password) {
    // TODO: implement registerUserPassword
    throw UnimplementedError();
  }

  @override
  Future<Resource<void>> requestNewPassword(String email) {
    return Resource.asFuture(
        () => _authRemoteDataSource.requestNewPassword(email));
  }
}
