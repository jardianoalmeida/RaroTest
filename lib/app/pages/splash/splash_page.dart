import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:raro_test/app/widgets/logo_app/logo_app_widget.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), (){
      Modular.to.pushNamed('/login');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return I18n(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            padding: EdgeInsets.all(8),
            // decoration: BoxDecoration(
            //   shape: BoxShape.circle,
            //   border: Border.all(
            //     color: AppColorScheme.white,
            //     width: 4
            //   ),
            // ),
            child: LogoAppWidget(),
          ),
        ),
      ),
    );
  }
}
