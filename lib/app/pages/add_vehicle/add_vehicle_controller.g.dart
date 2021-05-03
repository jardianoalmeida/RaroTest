// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_vehicle_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddVehicleController on _AddVehicleControllerBase, Store {
  final _$modelAtom = Atom(name: '_AddVehicleControllerBase.model');

  @override
  String? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(String? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$licencePlateAtom =
      Atom(name: '_AddVehicleControllerBase.licencePlate');

  @override
  String? get licencePlate {
    _$licencePlateAtom.reportRead();
    return super.licencePlate;
  }

  @override
  set licencePlate(String? value) {
    _$licencePlateAtom.reportWrite(value, super.licencePlate, () {
      super.licencePlate = value;
    });
  }

  final _$imgAtom = Atom(name: '_AddVehicleControllerBase.img');

  @override
  String? get img {
    _$imgAtom.reportRead();
    return super.img;
  }

  @override
  set img(String? value) {
    _$imgAtom.reportWrite(value, super.img, () {
      super.img = value;
    });
  }

  final _$addAsyncAction = AsyncAction('_AddVehicleControllerBase.add');

  @override
  Future<dynamic> add(dynamic context) {
    return _$addAsyncAction.run(() => super.add(context));
  }

  final _$_AddVehicleControllerBaseActionController =
      ActionController(name: '_AddVehicleControllerBase');

  @override
  void changeModel(String model) {
    final _$actionInfo = _$_AddVehicleControllerBaseActionController
        .startAction(name: '_AddVehicleControllerBase.changeModel');
    try {
      return super.changeModel(model);
    } finally {
      _$_AddVehicleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLicencePlate(String licen) {
    final _$actionInfo = _$_AddVehicleControllerBaseActionController
        .startAction(name: '_AddVehicleControllerBase.changeLicencePlate');
    try {
      return super.changeLicencePlate(licen);
    } finally {
      _$_AddVehicleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeImg(String img) {
    final _$actionInfo = _$_AddVehicleControllerBaseActionController
        .startAction(name: '_AddVehicleControllerBase.changeImg');
    try {
      return super.changeImg(img);
    } finally {
      _$_AddVehicleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
licencePlate: ${licencePlate},
img: ${img}
    ''';
  }
}
