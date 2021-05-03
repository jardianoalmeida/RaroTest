import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raro_test/app/styles/app_color_scheme.dart';
import 'package:raro_test/app/styles/app_images.dart';

class LogoAppWidget extends StatelessWidget {
  final double? size;

  const LogoAppWidget({
    Key? key,
    this.size,
  }) : super(key: key);

  static const textColor = AppColorScheme.primarySwatch;
  static const backgroundColor = AppColorScheme.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.7,
      alignment: size == null ? null : Alignment.center,
      child: Image.asset(AppImages.logo),
    );
  }
}
