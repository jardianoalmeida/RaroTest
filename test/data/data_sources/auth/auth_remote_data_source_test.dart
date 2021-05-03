import 'package:raro_test/data/data_sources/auth/auth_remote_data_source.dart';
import 'package:raro_test/di/di.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AuthRemoteDataSource dataSource;

  setUp(() {
    configureInjection();
    dataSource = getIt();
  });

  test('Auth remote_data_source test', () async {});
}
