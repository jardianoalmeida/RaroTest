import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final GetIt getIt = GetIt.instance;
bool _diInitialized = false;

@injectableInit
void configureInjection([String? env]) {
  Firebase.initializeApp().then((value) {
    if (!_diInitialized) {
      $initGetIt(getIt, environment: env!);
      _diInitialized = true;
    }
  });
}
