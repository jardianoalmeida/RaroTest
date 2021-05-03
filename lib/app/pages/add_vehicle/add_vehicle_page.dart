import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:raro_test/app/styles/app_color_scheme.dart';
import 'package:raro_test/app/styles/app_images.dart';
import 'package:raro_test/app/utils/validators.dart';
import 'package:raro_test/app/widgets/back_button/back_button_widget.dart';
import 'package:raro_test/app/widgets/button_app/button_app_widget.dart';
import 'package:raro_test/app/widgets/custom_app_bar/custom_app_bar_widget.dart';
import 'package:raro_test/app/widgets/text_form_field/text_form_field_widget.dart';
import 'add_vehicle_controller.dart';

class AddVehiclePage extends StatefulWidget {
  final QueryDocumentSnapshot? model;

  const AddVehiclePage({Key? key, this.model}) : super(key: key);

  @override
  _AddVehiclePageState createState() => _AddVehiclePageState();
}

class _AddVehiclePageState
    extends ModularState<AddVehiclePage, AddVehicleController> {
  //use 'controller' variable to access controller

  ImagePicker picker = ImagePicker();
  TextEditingController modelController = new TextEditingController();
  TextEditingController licencePlateController = new TextEditingController();
  TextEditingController vacancyController = new TextEditingController();
  String? img;
  final spacer = const SizedBox(
    height: 25,
  );

  @override
  void initState() {
    requestPermissions();
    super.initState();
  }

  void requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.model != null) {
      modelController.text = widget.model!['model'];
      licencePlateController.text = widget.model!['licence_plate'];
      vacancyController.text = widget.model!['vacancy'];
      controller.changeModel(widget.model!['model']);
      controller.changeVacancy(widget.model!['vacancy']);
      controller.changeLicencePlate(widget.model!['licence_plate']);
      controller.changeImg(widget.model!['img']);
    }
    return Scaffold(
      appBar: CustomAppBar(
        leading: BackButtonWidget(onPressed: () => Navigator.pop(context)),
        appBarHeight: 79,
        appBarRadius: 1,
        title: Text(
          widget.model == null ? "Adicionar Veículo" : "Atualizar Veículo",
          style: TextStyle(fontSize: 20, color: AppColorScheme.black),
        ),
        backgroundColor: () => Colors.blue,
        actions: [],
      ),
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white10,
          width: MediaQuery.of(context).size.width * 1.0,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Card(
            color: Colors.white,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 16,
                    ),
                    Text("Modelo"),
                    Observer(builder: (context) {
                      return TextFormFieldWidget(
                        controller: modelController,
                        titleLabel: "Ex: Honda Civic",
                        borderColor: Colors.red,
                        borderError: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: AppColorScheme.grey,
                            width: 1.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: AppColorScheme.grey,
                            width: 1.0,
                          ),
                        ),
                        validator: (String? value) {
                          return Validators.string(
                            value: value!,
                            message: "O campo não pode ser vazio",
                          ).toString();
                        },
                        onChanged: (String value) {
                          controller.changeModel(value);
                        },
                      );
                    }),
                    SizedBox(
                      height: 16,
                    ),
                    Text("Placa"),
                    Observer(builder: (context) {
                      return TextFormFieldWidget(
                        controller: licencePlateController,
                        titleLabel: "Ex: BAX-564",
                        borderColor: Colors.red,
                        borderError: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: AppColorScheme.grey,
                            width: 1.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: AppColorScheme.grey,
                            width: 1.0,
                          ),
                        ),
                        validator: (String? value) => Validators.string(
                          value: value!,
                          message: "O campo não pode ser vazio",
                        ).toString(),
                        onChanged: (String value) =>
                            controller.changeLicencePlate(value),
                      );
                    }),
                    Text("Vaga"),
                    Observer(builder: (context) {
                      return TextFormFieldWidget(
                        controller: vacancyController,
                        titleLabel: "Ex: 01",
                        borderColor: Colors.red,
                        borderError: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: AppColorScheme.grey,
                            width: 1.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: AppColorScheme.grey,
                            width: 1.0,
                          ),
                        ),
                        validator: (String? value) => Validators.string(
                          value: value!,
                          message: "O campo não pode ser vazio",
                        ).toString(),
                        onChanged: (String value) {
                          print(value);
                          controller.changeVacancy(value);
                        },
                      );
                    }),
                    Observer(builder: (context) {
                      return InkWell(
                        onTap: () async {
                          PickedFile? pickedFile = await picker.getImage(
                            source: ImageSource.camera,
                            maxHeight: 200,
                          );

                          File? file = File(pickedFile!.path);
                          List<int> imageBytes = file.readAsBytesSync();
                          print(imageBytes);
                          String base64Image = base64Encode(imageBytes);
                          controller.changeImg(base64Image);
                        },
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: MemoryImage(Base64Decoder()
                              .convert(controller.img.toString())),
                          child: Icon(Icons.camera_alt),
                        ),
                      );
                    }),
                    spacer,
                    Observer(builder: (_) {
                      return ButtonAppWidget(
                        color: AppColorScheme.primarySwatch[900],
                        colorContent: AppColorScheme.white,
                        text: 'Salvar',
                        onPressed: () {
                          if (widget.model == null) {
                            controller.add(context);
                          }
                          {
                            controller.update(context, widget.model!.id);
                          }
                        }, //Modular.to.navigate("/home"),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
