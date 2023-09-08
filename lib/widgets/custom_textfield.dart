import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/app/constants/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.validationText,
      this.keyboardType,
      this.textFormatter});

  final TextEditingController controller;
  final String hintText;
  final String validationText;
  final TextInputType? keyboardType;
  final TextInputFormatter? textFormatter;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: TColors.textBackgroundColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
      ),
      inputFormatters: textFormatter != null ? [textFormatter ?? FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9]$'))] : null,
      validator: (value) => value!.isEmpty ? validationText : null,
    );
  }
}
