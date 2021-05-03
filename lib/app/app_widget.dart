import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:raro_test/app/constants/routers.dart';
import 'package:raro_test/app/styles/app_theme_data.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SnowMaterialApp(
      title: 'Flutter Demo',
      theme: AppThemeData.themeDataLight,
      darkTheme: AppThemeData.themeDataDark,
      builder: (context, child) => Scaffold(
        // Global GestureDetector that will dismiss the keyboard
        body: GestureDetector(
          onTap: () {
            // When running in iOS, dismiss the keyboard when any Tap happens outside a TextField
            if (Platform.isIOS) WidgetUtils.hideKeyboard(context);
          },
          child: child,
        ),
      ),
      initialRoute: AppRoutes.splash,
    );
  }
}
