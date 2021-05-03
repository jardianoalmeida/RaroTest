import 'package:flutter/material.dart';
import 'package:raro_test/app/utils/validators.dart';
import 'package:raro_test/app/widgets/text_form_field/text_form_field_widget.dart';

class EmailTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onSaved;
  final String label;

  const EmailTextFieldWidget({
    Key? key,
    required this.controller,
    required this.onSaved,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller,
      onChanged: onSaved,
      validator: (e) => '', // Validators.email,
      titleLabel: label,
    );
  }
}
