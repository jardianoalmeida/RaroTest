import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_test/app/pages/home/home_controller.dart';
import 'package:raro_test/app/pages/home/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];

}
