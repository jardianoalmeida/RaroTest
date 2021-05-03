import 'package:raro_test/domain/usecases/auth/reset_password_use_case/reset_password_use_case_use_case.dart';
import 'package:raro_test/di/di.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ResetPasswordUseCaseUseCase resetPasswordUseCase;

  setUp(() {
    configureInjection();
    resetPasswordUseCase = getIt();
  });

  test('ResetPasswordUseCase usecase test', () async {
    //final result = await resetPasswordUseCase();
    //expect(result, match);
  });
}
