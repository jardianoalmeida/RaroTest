import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_test/app/pages/add_vehicle/add_vehicle_controller.dart';
import 'package:raro_test/app/pages/add_vehicle/add_vehicle_page.dart';

class AddVehicleModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i)=> AddVehicleController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => AddVehiclePage(model: args.data)),
  ];
}
