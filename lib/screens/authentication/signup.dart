import 'package:flutter/material.dart';
import '../../app/constants/color.dart';
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
                      decoration: InputDecoration(
                        hintText: "City",
                        filled: true,
                        fillColor: TColors.textBackgroundColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Please enter city" : null,
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
                      decoration: InputDecoration(
                        hintText: "Office Number",
                        filled: true,
                        fillColor: TColors.textBackgroundColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Please enter office number" : null,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              RoundedButton(
                title: 'Sign Up',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/DashboardScreen');
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
