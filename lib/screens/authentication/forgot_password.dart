import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task/main.dart';

import '../../app/constants/color.dart';
import '../../widgets/rounded_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getEmail();
  }

  Future<void> _getEmail() async {
    final prefs = await _prefs;
    emailController.text = prefs.getString('email') ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Forgot Password"),
          centerTitle: true,
          backgroundColor: TColors.appbarColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 100),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 430,
                ),
                Column(
                  children: [
                    RoundedButton(
                        title: 'Send Reset Password',
                        onTap: () async {
                          supabaseService.setLoading(true);
                          if (_formKey.currentState!.validate()) {
                            await supabase.auth
                                .resetPasswordForEmail(emailController.text)
                                .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please check your email"),
                                ),
                              );
                              supabaseService.setLoading(false);
                              return Navigator.pushNamed(
                                  context, '/LoginScreen');
                            }).catchError(
                              (error) {
                                log(error, name: "ON ERROR");
                                supabaseService.setLoading(false);
                                return ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        content: Text("Reset Pasword $error")));
                              },
                            );
                          }
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
