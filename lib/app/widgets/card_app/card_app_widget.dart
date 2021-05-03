import 'package:flutter/material.dart';

class CardAppWidget extends StatelessWidget {
  final Text? text;
  final Icon? icon;
  final Icon? icon2;
  final Padding? padding;
  final CircleAvatar? circleAvatar;
  final CircleBorder? circleBorder;
  final double? height;
  final Function? onTap;
  final Widget? child;

  const CardAppWidget(
      {Key? key,
        this.text,
        this.icon,
        this.padding,
        this.circleAvatar,
        this.circleBorder,
        this.height,
        this.icon2, required this.onTap, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Container(
          height: height ?? 100,
          child: Card(
            elevation: 2,
            child: Center(child: ListTile(leading: icon2, title: text, trailing: child)),
          ),
        ),
        onTap: () => onTap,
      ),
    );
  }
}
