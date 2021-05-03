import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:raro_test/app/styles/app_color_scheme.dart';
import 'package:raro_test/app/styles/app_text_theme.dart';

class ListHomeWidget extends StatelessWidget {
  final String? linkImage;
  final String? name;
  final Widget? trailing;

  const ListHomeWidget({Key? key, this.linkImage, this.name, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding:
        const EdgeInsets.only(bottom: 8, top: 8, left: 0, right: 8),
        child: ListTile(
          leading: CircleAvatar(
            radius: 40,
            backgroundImage: MemoryImage(Base64Decoder().convert(linkImage!.toString())),
          ),
          title: Text(
            name!,
            style: AppTextTheme.textTheme.subtitle2!.copyWith(color: AppColorScheme.black, fontSize: 18),
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}
