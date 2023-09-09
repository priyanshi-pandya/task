import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/app/constants/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText, this.validationText,
      this.keyboardType,
      this.textFormatter, this.isEnabled});

  final TextEditingController controller;
  final String hintText;
  final String? validationText;
  final TextInputType? keyboardType;
  final TextInputFormatter? textFormatter;
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    // log(isEnabled.toString(), name: "is enabled");
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      enabled: isEnabled,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: TColors.textBackgroundColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
      ),
      inputFormatters: textFormatter != null ? [textFormatter ?? FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9]$'))] : null,
      validator: (value) {
        if(controller == "officeNoController"){
          if(value!.isEmpty){
            return validationText;
          }else if(value!.length > 10){
            return "Too long name";
          }
        }else{
          if(value!.isEmpty){
            return validationText;
          }else{
            return null;
          }
        }
      },
    );
  }
}
