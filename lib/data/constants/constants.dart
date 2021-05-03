import 'package:flutter_snow_base/flutter_snow_base.dart';

import 'package:raro_test/app_flavor_values.dart';
import 'features.dart';

abstract class Constants {
  static AppFlavorValues get flavor => FlavorConfig.values();

  static final flavorDev = AppFlavorValues(
    baseUrl: localhost,
    features: () => Features.devRemote,
    socketUrl: '',
    anotherUrl: '',
    apiVersion: '',
  );

  static final flavorQa = AppFlavorValues(
    baseUrl: localhost,
    features: () => Features.qaRemote,
    socketUrl: '',
    anotherUrl: '',
    apiVersion: '',
  );

  static final flavorProd = AppFlavorValues(
    baseUrl: localhost,
    features: () => Features.prodRemote,
    socketUrl: '',
    anotherUrl: '',
    apiVersion: '',
  );

  static const localhost = 'http://10.0.2.2:1337';
}

AppFlavorValues get flavor => Constants.flavor;
