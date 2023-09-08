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
      alignment: Alignment.center,
      margin: EdgeInsets.zero,
      // padding: pad,
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(text, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
    );
  }
}
