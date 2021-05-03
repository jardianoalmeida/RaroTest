import 'package:flutter/material.dart';
import 'package:raro_test/app/styles/app_color_scheme.dart';
import 'package:raro_test/app/styles/app_text_theme.dart';

class ButtonAppWidget extends StatelessWidget {
  final String? text;
  final IconData? iconData;
  final Color? color;
  final Color? colorContent;
  final Function? onPressed;

  const ButtonAppWidget({
    Key? key,
    this.text,
    this.iconData,
    this.color,
    this.onPressed,
    this.colorContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: color,
      ),
      child: RaisedButton(
          disabledElevation: 0.0,
          focusElevation: 0.0,
          highlightElevation: 0.0,
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          elevation: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 0.0),
          onPressed: ()=> onPressed!(),
          disabledTextColor: AppColorScheme.white,
          textColor: AppColorScheme.white,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text!,
                style: AppTextTheme.textTheme.headline6!
                    .copyWith(color: colorContent, fontSize: 18),
              ),
            ],
          )),
    );
  }
}
