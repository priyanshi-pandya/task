import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task/store/supabase_service.dart';

import '../app/constants/color.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  RoundedButton(
      {super.key, required this.title, required this.onTap});

  final supabaseService = SupabaseService();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => ElevatedButton(
        onPressed: onTap,
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
        child:
            supabaseService.isLoading ? const CircularProgressIndicator() : Text(title),
      ),
    );
  }
}
