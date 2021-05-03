
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'add_vehicle_controller.g.dart';

class AddVehicleController = _AddVehicleControllerBase
    with _$AddVehicleController;

abstract class _AddVehicleControllerBase with Store {
  @observable
  String? model;

  @observable
  String? licencePlate;

  @observable
  String? vacancy;

  @observable
  String? img;

  @action
  void changeVacancy(String vacancy) {
    this.vacancy = vacancy;
  }

  @action
  void changeModel(String model) {
    this.model = model;
  }

  @action
  void changeLicencePlate(String licen) {
    this.licencePlate = licen;
  }

  @action
  void changeImg(String img) {
    this.img = img;
  }

  @action
  Future<dynamic> add(context) async {
    Map<String, dynamic> newVehicle = new Map<String, dynamic>();
    newVehicle["model"] = model;
    newVehicle["licence_plate"] = licencePlate;
    newVehicle["vacancy"] = vacancy;
    newVehicle["img"] = img;

    FirebaseFirestore.instance
        .collection("vehicle")
        .add(newVehicle)
        .whenComplete(() {
          Navigator.of(context).pop();
    }).catchError((e) {
      print("Error: " + e.toString());
    });
  }

  @action
  Future<dynamic> update(context, id) async {
    Map<String, dynamic> newVehicle = new Map<String, dynamic>();
    newVehicle["model"] = model;
    newVehicle["licence_plate"] = licencePlate;
    newVehicle["vacancy"] = vacancy;
    newVehicle["img"] = img;

    FirebaseFirestore.instance
        .collection("vehicle")
        .doc(id)
        .update(newVehicle)
        .whenComplete(() {
      Navigator.of(context).pop();
    }).catchError((e) {
      print("Error: " + e.toString());
    });
  }

}
