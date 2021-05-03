import 'package:injectable/injectable.dart';
import 'package:raro_test/domain/repositories/feature/feature_repository.dart';
import 'package:raro_test/domain/usecases/base/base_future_use_case.dart';

/// Every use case must be named according to its action.
/// E.g. [GetUserProfile]

@injectable
class DoSomethingUseCase extends BaseFutureUseCase<String, void> {
  final FeatureRepository _repository;

  DoSomethingUseCase(this._repository);

  @override
  Future<void> call([String? params]) => _repository.doSomething();
}
