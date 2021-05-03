import 'package:raro_test/domain/usecases/auth/request_new_password_use_case/request_new_password_use_case_use_case.dart';
import 'package:raro_test/di/di.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  RequestNewPasswordUseCaseUseCase requestNewPasswordUseCase;

  setUp(() {
    configureInjection();
    requestNewPasswordUseCase = getIt();
  });

  test('RequestNewPasswordUseCase usecase test', () async {
    //final result = await requestNewPasswordUseCase();
    //expect(result, match);
  });
}
