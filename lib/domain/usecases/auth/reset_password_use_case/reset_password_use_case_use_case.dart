import 'package:raro_test/domain/usecases/base/base_future_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCaseUseCase implements BaseFutureUseCase<void, void> {
  const ResetPasswordUseCaseUseCase();

  @override
  Future<void> call([void params]) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
