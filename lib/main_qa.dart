import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:raro_test/app/app_widget.dart';
import 'package:raro_test/data/constants/constants.dart';
import 'package:raro_test/data/helpers/error_mapper.dart';

import 'app/app_module.dart';
import 'app_flavor_values.dart';
import 'di/di.dart';

void main() {
  RunAppSnow(
    ModularApp(
      child: AppWidget(),
      module: AppModule(),
    ),
    flavorValues: Constants.flavorQa,
    getItInit: () {
      Resource.setErrorMapper((e) => ErrorMapper.from(e));
      configureInjection(qa.name);
    },
    flavor: Flavor.qa,
  );
}
/*
*/
