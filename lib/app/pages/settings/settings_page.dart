import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_test/app/constants/routers.dart';
import 'package:raro_test/app/styles/app_color_scheme.dart';
import 'package:raro_test/app/styles/app_images.dart';
import 'package:raro_test/app/styles/app_text_theme.dart';
import 'package:raro_test/app/widgets/card_app/card_app_widget.dart';
import 'package:raro_test/app/widgets/custom_app_bar/custom_app_bar_widget.dart';
import 'settings_controller.dart';

class SettingsPage extends StatefulWidget {
  final String title;
  final SettingsController controller = Modular.get();

  SettingsPage({Key? key, this.title = "Settings"}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

final SettingsController controller = Modular.get();

class _SettingsPageState extends ModularState<SettingsPage, SettingsController> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left), onPressed: (){
          Navigator.pop(context);
        },),
        appBarHeight: 79,
        appBarRadius: 1,
        title: Text(
          "Configurações",
          style: TextStyle(fontSize: 20),
        ), actions: [], backgroundColor: () => Color(0xff000000),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                widthFactor: 30,
                child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),

                    CircleAvatar(
                      radius: 40,
                      child: Container(
                        height: 40.0,
                        child: Image.asset(AppImages.logo),
                      ),
                    ),

                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Raro Labs",
                      style: AppTextTheme.textTheme.subtitle2!
                          .copyWith(color: AppColorScheme.black, fontSize: 18),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CardAppWidget(
              height: 90,
              icon2: Icon(
                Icons.directions_car,
                size: 40,
              ),
              child: Icon(
                Icons.arrow_forward_sharp,
                size: 30,
              ),
              text: Text(
                "Adicionar veículos",
                style: AppTextTheme.textTheme.subtitle2!
                    .copyWith(color: AppColorScheme.black, fontSize: 18),
              ),
              onTap: () {
                Modular.to.pushNamed(AppRoutes.addVehicle);
              },
            ),
            CardAppWidget(
              height: 90,
              icon2: Icon(
                Icons.add_alert_outlined,
                size: 40,
              ),
              child: CupertinoSwitch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
                trackColor: AppColorScheme.primarySwatch,
                activeColor: AppColorScheme.white,
              ),
              text: Text(
                "Notificações",
                style: AppTextTheme.textTheme.subtitle2!
                    .copyWith(color: AppColorScheme.black, fontSize: 18),
              ),
              onTap: () {
                Modular.to.pushNamed(AppRoutes.addVehicle);
              },
            ),
            CardAppWidget(
              height: 90,
              icon2: Icon(
                Icons.exit_to_app_outlined,
                size: 40,
              ),
              child: Icon(
                Icons.arrow_forward_sharp,
                size: 30,
              ),
              text: Text(
                "Sair",
                style: AppTextTheme.textTheme.subtitle2!
                    .copyWith(color: AppColorScheme.black, fontSize: 18),
              ),
              onTap: () {
                controller.signOut();
                Modular.to.pushNamed(AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
