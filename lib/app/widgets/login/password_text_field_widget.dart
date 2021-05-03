import 'package:flutter/material.dart';
import 'package:raro_test/app/utils/validators.dart';
import 'package:raro_test/app/widgets/text_form_field/text_form_field_widget.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String) onSaved;
  final String? label;
  final String Function(String value) validator;
  final bool? validateLenght;
  final bool? validateStrongness;
  final FocusNode? focusNode;
  final void Function(String value) onFieldSubmitted;
  final TextInputAction? textInputAction;
  final String? hint;
  final BorderRadius? borderRadius;
  final InputBorder? border;
  final InputBorder? borderError;

  const PasswordTextFieldWidget({
    Key? key,
    required this.controller,
    required this.onSaved,
    this.label,
    required this.validator,
    this.validateLenght = true,
    this.focusNode,
    required this.onFieldSubmitted,
    this.hint,
    this.textInputAction,
    this.validateStrongness = true, this.borderRadius, this.border, this.borderError,
  }) : super(key: key);

  @override
  _PasswordTextFieldWidgetState createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      obscureText: obscure,
      controller: widget.controller,
      onChanged: widget.onSaved,
      hintText: widget.hint,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      border: widget.border,
      validator: (value) {
        final error = Validators.password(
          value,
          validateLenght: widget.validateLenght!,
          validateStrongness: widget.validateStrongness!,
        );
        if (error == null && widget.validator != null) {
          return widget.validator(value);
        }
        return error!;
      },
      titleLabel: widget.label,
      suffixIcon: IconButton(
        icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
        onPressed: () {
          setState(() {
            obscure = !obscure;
          });
        },
      ),
    );
  }
}
