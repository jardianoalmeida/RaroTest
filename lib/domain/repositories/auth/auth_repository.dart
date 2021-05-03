import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:raro_test/domain/entities/user/user_entity.dart';

abstract class AuthRepository {
  Future<Resource<UserCredential>>? authenticate({String username, String password});

  Future<Resource<UserEntity>> refreshToken({String token});

  Future<Resource<UserEntity>> getUser([bool refresh = false]);

  Future<Resource<UserEntity>> registerUserPassword(
      String email, String password);

  Future<void> logoutUser();

  Stream<Resource<UserEntity>> getUserStream();

  Future<Resource<void>> requestNewPassword(String username);
}
