import 'package:flutter/material.dart';
import 'package:raro_test/app/styles/app_images.dart';
import 'package:raro_test/app/widgets/button_app/button_app_widget.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String content;
  const SuccessDialog({
    Key? key,
    this.title = '',
    this.content = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Transform.translate(
              offset: Offset(20, -20),
              child: IconButton(
                icon: Icon(Icons.clear, color: Colors.red,),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          )
        ],
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w100),
            ),
            SizedBox(
              height: 25,
            ),
            ButtonAppWidget(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: "Continuar",
            ),
          ],
        ),
      ),
    );
  }
}
