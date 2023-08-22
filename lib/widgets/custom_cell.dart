import 'package:flutter/material.dart';

import '../app/constants/color.dart';

class CustomCell extends StatelessWidget {
  final String text;
  final Color color;
  final EdgeInsets? pad;
  const CustomCell({
    super.key, required this.text, required this.color, this.pad
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: pad,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(text),
    );
  }
}
