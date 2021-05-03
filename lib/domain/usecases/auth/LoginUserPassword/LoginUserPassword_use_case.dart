import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:raro_test/domain/entities/auth/auth_entity.dart';
import 'package:raro_test/domain/entities/user/user_entity.dart';
import 'package:raro_test/domain/repositories/auth/auth_repository.dart';
import 'package:raro_test/domain/usecases/base/base_future_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUserPasswordUseCase extends BaseFutureUseCase<AuthEntity, Resource<UserCredential>> {
  final AuthRepository _repository;

  LoginUserPasswordUseCase(this._repository);

  @override
  Future<Resource<UserCredential>> call([AuthEntity? params]) async {
    //Todo null safety me pegou nessa
    final Resource<UserCredential>? user = await _repository.authenticate(
      username: params!.username.toString(),
      password: params.password.toString(),
    );
    return user!;
  }
}
