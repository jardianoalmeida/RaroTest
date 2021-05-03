import 'package:flutter/material.dart';
import 'package:raro_test/app/styles/app_color_scheme.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? titleLabel;
  final String Function(String value) validator;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final BorderRadius? borderRadius;
  final InputBorder? border;
  final InputBorder? borderError;
  final EdgeInsets? contentPadding;
  final Widget? prefixIcon;
  final String? hintText;
  final void Function(String value)? onChanged;
  final FocusNode? focusNode;
  final void Function(String value)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Color? color;
  final Color? borderColor;

  const TextFormFieldWidget({Key? key,
    this.titleLabel,
    required this.validator,
    required this.onChanged,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.hintText = "Digite aqui",
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
    this.borderColor,
    this.border,
    this.borderError})
      : this.borderRadius = const BorderRadius.all(Radius.circular(4)),
        this.contentPadding = const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        this.prefixIcon = null,
        this.color = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: (e) => validator(e!),
        onChanged: (e) => onChanged!(e),
        controller: controller,
        obscureText: obscureText,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          contentPadding: contentPadding,
          border: border,
 //         errorBorder: borderError,
//          focusedBorder: border,
          focusedErrorBorder: InputBorder.none,
          errorStyle: TextStyle(
            color: AppColorScheme.colorScheme.error,
          ),
          enabledBorder: border,
          focusedBorder: border,
          //enabledBorder: InputBorder.none,
          hintText: hintText,
          labelText: titleLabel,
          suffixIcon: suffixIcon == null
              ? null
              : Padding(
            child: suffixIcon,
            padding: const EdgeInsets.only(
              right: 12,
            ),
          ),
          prefixIcon: prefixIcon == null
              ? null
              : Padding(
            child: prefixIcon,
            padding: const EdgeInsets.only(
              left: 12,
            ),
          ),
        ),
      ),
    );
  }
}
