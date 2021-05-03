import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_test/di/di.dart';
import 'package:raro_test/domain/usecases/auth/request_new_password_use_case/request_new_password_use_case_use_case.dart';

part 'recover_password_controller.g.dart';

class RecoverPasswordController = _RecoverPasswordControllerBase
    with _$RecoverPasswordController;

abstract class _RecoverPasswordControllerBase with Store {
  final RequestNewPasswordUseCaseUseCase _requestNewPasswordUseCase = getIt();

  @observable
  Resource<void> recoverPasswordResource = Resource.success();
  @action
  setRecoverPasswordResource(Resource<void> value) => recoverPasswordResource = value;

  Future<void> recoveryPassword(String username) async {
    setRecoverPasswordResource(Resource.loading());
    setRecoverPasswordResource(await _requestNewPasswordUseCase(username));
  }
}
