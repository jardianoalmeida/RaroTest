import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:injectable/injectable.dart';
import 'package:raro_test/domain/repositories/auth/auth_repository.dart';
import 'package:raro_test/domain/usecases/base/base_future_use_case.dart';

@injectable
class RequestNewPasswordUseCaseUseCase implements BaseFutureUseCase<String, Resource<void>> {
  final AuthRepository _repository;
  const RequestNewPasswordUseCaseUseCase(this._repository);

  @override
  Future<Resource<void>> call([String? username]) {
    return _repository.requestNewPassword(username!);
  }
}
