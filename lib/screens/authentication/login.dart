import 'package:flutter/material.dart';

import '../../app/constants/color.dart';
import '../../widgets/rounded_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final pswdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Sign In"),
          centerTitle: true,
          backgroundColor: TColors.appbarColor),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      filled: true,
                      fillColor: TColors.textBackgroundColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Please enter email" : null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: pswdController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      filled: true,
                      fillColor: TColors.textBackgroundColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Please enter password" : null,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                RoundedButton(
                  title: 'Sign In',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/DashboardScreen');
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundedButton(
                  title: 'Sign Up',
                  onTap: () => Navigator.pushNamed(context, '/SignUpScreen'),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
