import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task/main.dart';
import 'package:task/screens/dashboard/dashboard.dart';
import 'package:task/store/supabase_service.dart';

import '../../app/constants/color.dart';
import '../../widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User? _user;
  final supabaseService = SupabaseService();
  final emailController = TextEditingController();
  final pswdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getAuth();
  }

  Future<void> _getAuth() async {
    setState(() {
      _user = Supabase.instance.client.auth.currentUser;
    });
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      setState(() {
        _user = data.session?.user;
      });
    });
    if (_user != null) {
      Navigator.pushNamed(
        context,
        'DashboardScreen',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Sign In"),
          centerTitle: true,
          backgroundColor: TColors.appbarColor),
      body: SafeArea(
          child: SingleChildScrollView(
        child: supabaseService.isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
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
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: pswdController,
                            obscureText: true,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
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
                    const SizedBox(
                      height: 320,
                    ),
                    Column(
                      children: [
                        RoundedButton(
                          title: 'Sign In',
                          onTap: () async {
                            supabaseService.setLoading(true);
                            if (_formKey.currentState!.validate()) {
                              try {
                                await supabase.auth.signInWithPassword(
                                    email: emailController.text.toString(),
                                    password: pswdController.text.toString());

                                supabaseService.setLoading(false);
                                Navigator.pushNamed(
                                    context, '/DashboardScreen');
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Login Failed $e")));
                                supabaseService.setLoading(false);
                              }
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RoundedButton(
                          title: 'Sign Up',
                          onTap: () =>
                              Navigator.pushNamed(context, '/SignUpScreen'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      )),
    );
  }
}
