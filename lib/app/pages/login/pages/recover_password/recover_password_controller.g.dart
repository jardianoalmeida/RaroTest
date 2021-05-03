// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecoverPasswordController on _RecoverPasswordControllerBase, Store {
  final _$recoverPasswordResourceAtom =
      Atom(name: '_RecoverPasswordControllerBase.recoverPasswordResource');

  @override
  Resource<void> get recoverPasswordResource {
    _$recoverPasswordResourceAtom.reportRead();
    return super.recoverPasswordResource;
  }

  @override
  set recoverPasswordResource(Resource<void> value) {
    _$recoverPasswordResourceAtom
        .reportWrite(value, super.recoverPasswordResource, () {
      super.recoverPasswordResource = value;
    });
  }

  final _$_RecoverPasswordControllerBaseActionController =
      ActionController(name: '_RecoverPasswordControllerBase');

  @override
  dynamic setRecoverPasswordResource(Resource<void> value) {
    final _$actionInfo =
        _$_RecoverPasswordControllerBaseActionController.startAction(
            name: '_RecoverPasswordControllerBase.setRecoverPasswordResource');
    try {
      return super.setRecoverPasswordResource(value);
    } finally {
      _$_RecoverPasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recoverPasswordResource: ${recoverPasswordResource}
    ''';
  }
}
