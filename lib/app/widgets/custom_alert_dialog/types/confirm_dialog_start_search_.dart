import 'package:flutter/material.dart';

class ConfirmDialogStartSearch extends StatelessWidget {
  final Text title;
  final Text content;
  final RaisedButton button1;
  final RaisedButton button2;

  ConfirmDialogStartSearch({
    required this.title,
    required this.content,
    required this.button1,
    required this.button2,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      buttonPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      titlePadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      actionsPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      insetPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: title,
      content: content,
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            button1,
            SizedBox(
              width: 16,
            ),
            button2,
          ],
        ),
      ],
    );
  }
}
