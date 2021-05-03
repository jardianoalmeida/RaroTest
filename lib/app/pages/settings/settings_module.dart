import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_test/app/pages/settings/settings_controller.dart';
import 'package:raro_test/app/pages/settings/settings_page.dart';

class SettingsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i)=>SettingsController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SettingsPage()),
  ];
}
