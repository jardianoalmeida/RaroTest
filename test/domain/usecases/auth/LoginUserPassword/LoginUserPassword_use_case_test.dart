import 'package:raro_test/domain/usecases/auth/LoginUserPassword/LoginUserPassword_use_case.dart';
import 'package:raro_test/di/di.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  LoginUserPasswordUseCase loginUserPassword;

  setUp(() {
    configureInjection();
    loginUserPassword = getIt();
  });

  test('LoginUserPassword usecase test', () async {
    //final result = await loginUserPassword();
    //expect(result, match);
  });
}
