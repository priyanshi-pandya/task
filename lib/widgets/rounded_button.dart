import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../app/constants/color.dart';
import '../main.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  RoundedButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ElevatedButton(
          onPressed: supabaseService.isLoading ? null : onTap,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(TColors.buttonColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
            ),
          ),
          child: Text(title),
        );
      },
    );
  }
}
