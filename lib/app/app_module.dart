import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_test/app/constants/routers.dart';
import 'package:raro_test/app/pages/add_vehicle/add_vehicle_module.dart';
import 'package:raro_test/app/pages/home/home_module.dart';
import 'package:raro_test/app/pages/login/login_module.dart';
import 'package:raro_test/app/pages/settings/settings_module.dart';
import 'package:raro_test/app/pages/splash/splash_module.dart';

import 'app_widget.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(AppRoutes.splash, module: SplashModule(),),
    ModuleRoute(AppRoutes.home, module: HomeModule(),),
    ModuleRoute(AppRoutes.settings, module: SettingsModule(),),
    ModuleRoute(AppRoutes.addVehicle, module: AddVehicleModule(),),
    ModuleRoute(AppRoutes.login, module: LoginModule(),),
  ];
}
