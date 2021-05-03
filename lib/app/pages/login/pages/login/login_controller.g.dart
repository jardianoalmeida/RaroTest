// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginBase, Store {
  final _$userResourceAtom = Atom(name: '_LoginBase.userResource');

  @override
  Resource<UserCredential>? get userResource {
    _$userResourceAtom.reportRead();
    return super.userResource;
  }

  @override
  set userResource(Resource<UserCredential>? value) {
    _$userResourceAtom.reportWrite(value, super.userResource, () {
      super.userResource = value;
    });
  }

  final _$loginWithEmailAsyncAction = AsyncAction('_LoginBase.loginWithEmail');

  @override
  Future<void> loginWithEmail(AuthEntity auth) {
    return _$loginWithEmailAsyncAction.run(() => super.loginWithEmail(auth));
  }

  @override
  String toString() {
    return '''
userResource: ${userResource}
    ''';
  }
}
