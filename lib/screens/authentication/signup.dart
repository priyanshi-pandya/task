import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task/main.dart';
import '../../app/constants/color.dart';
import '../../store/supabase_service.dart';
import '../../widgets/rounded_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final pswdController = TextEditingController();

  final nameController = TextEditingController();

  final noController = TextEditingController();

  final cityController = TextEditingController();

  final ofNoController = TextEditingController();

  final supabaseService = SupabaseService();

  void insertUserData(
      {required name,
      required email,
      required pswd,
      required no,
      city,
      offno}) async {
    final userData = {
      'username': name,
      'useremail': email,
      'userpwd': pswd,
      'mobileno': no,
      'usercity': city,
      'officeno': offno,
      // 'timestamp': DateTime.now(),
    };

    await supabase
        .from('user_mas')
        .insert([userData])
        .execute()
        .then(
          (value) => debugPrint(
              "********************Data inserted successfully********************"),
        )
        .catchError(
          (error) => debugPrint(
              "**************************Error while inserting data $error******************"),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Sign Up"),
        centerTitle: true,
        backgroundColor: TColors.appbarColor,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 100,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      controller: emailController,
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        filled: true,
                        fillColor: TColors.textBackgroundColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter email";
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return "Invalid email address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: pswdController,
                      obscureText: true,
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      decoration: InputDecoration(
                        hintText: "Password",
                        filled: true,
                        fillColor: TColors.textBackgroundColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        } else if (value.length < 8) {
                          return "Password should be atleast 8 characters";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: nameController,
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                        hintText: "Name",
                        filled: true,
                        fillColor: TColors.textBackgroundColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Please enter name" : null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: noController,
                      keyboardType: TextInputType.number,
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                        hintText: "Mobile No.",
                        filled: true,
                        fillColor: TColors.textBackgroundColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter number";
                        } else if (value.length != 10) {
                          return "Number should be of 10 digits";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: cityController,
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                        hintText: "City",
                        filled: true,
                        fillColor: TColors.textBackgroundColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: ofNoController,
                      keyboardType: TextInputType.number,
                      scrollPadding: EdgeInsets.only(
                          bottom:
                              MediaQuery.of(context).viewInsets.bottom + 50),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                        hintText: "Office Number",
                        filled: true,
                        fillColor: TColors.textBackgroundColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
                RoundedButton(
                  title: 'Sign Up',
                  onTap: () async {
                    supabaseService.setLoading(true);
                    log(_formKey.currentState!.validate().toString(),
                        name: "validateeee");
                    if (_formKey.currentState!.validate()) {
                      try {
                        await supabase.auth.signUp(
                          password: pswdController.text,
                          email: emailController.text,
                        );
                        insertUserData(
                          email: emailController.text,
                          name: nameController.text,
                          no: noController.text,
                          pswd: pswdController.text,
                          city: cityController.text,
                          offno: ofNoController.text,
                        );
                        Navigator.pushNamed(context, '/DashboardScreen');
                        supabaseService.setLoading(false);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Sign up Failed $e"),
                          ),
                        );
                        supabaseService.setLoading(false);
                      }
                    }
                  },
                ),
            ],
          ),
        ),
      )),
    );
  }
}
