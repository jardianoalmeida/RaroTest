import 'package:raro_test/data/repositories/auth/auth_repository_impl.dart';
import 'package:raro_test/di/di.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AuthRepositoryImpl repo;

  setUp(() {
    configureInjection();
    repo = getIt();
  });

  test('Auth repository implementation test', () async {});
}
