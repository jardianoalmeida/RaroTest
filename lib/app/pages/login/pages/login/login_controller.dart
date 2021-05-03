import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_test/di/di.dart';
import 'package:raro_test/domain/entities/auth/auth_entity.dart';
import 'package:raro_test/domain/entities/user/user_entity.dart';
import 'package:raro_test/domain/usecases/auth/LoginUserPassword/LoginUserPassword_use_case.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  final loginUseCase = getIt.get<LoginUserPasswordUseCase>();

  @observable
  Resource<UserCredential>? userResource;

  @action
  Future<void> loginWithEmail(AuthEntity auth) async {
    try {
      userResource = Resource.loading();
      userResource = await loginUseCase(auth);
    } catch (e) {
      userResource = Resource.failed(error: e);
    }
  }
}
