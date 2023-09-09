import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task/main.dart';
import '../../app/constants/color.dart';
import '../../widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User? _user;

  TextEditingController emailController = TextEditingController();
  TextEditingController pswdController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void dispose() {
    emailController.dispose();
    pswdController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getPrefsData();
  }

  Future<void> _getPrefsData() async {
    var prefs = await _prefs;
    if (prefs.getString('email') != null) {
      emailController.text = prefs.getString('email').toString();
      pswdController.text = prefs.getString('pswd').toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Sign In"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: TColors.appbarColor),
      body: supabaseService.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 100),
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
                              validator: (value) => value!.isEmpty
                                  ? "Please enter password"
                                  : null,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/ForgotPasswordScreen');
                                  },
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero),
                                  ),
                                  child: const Text("Forgot Password?"),
                                ),
                              ],
                            )
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
                              if (_formKey.currentState!.validate()) {
                                try {
                                  supabaseService.setLoading(true);
                                  await supabase.auth.signInWithPassword(
                                      email: emailController.text.toString(),
                                      password: pswdController.text.toString());

                                  SharedPreferences prefs = await _prefs;
                                  prefs.setString(
                                      'email', emailController.text);
                                  prefs.setString('pswd', pswdController.text);
                                  supabaseService.setLoading(false);
                                  if (mounted) {
                                    Navigator.pushNamed(
                                        context, '/DashboardScreen');
                                  }
                                } catch (e) {
                                  if (e is AuthException &&
                                      e.message == "Email not confirmed" &&
                                      mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "Please confirm the link in your mail box"),
                                      ),
                                    );
                                  } else if (e is AuthException &&
                                      e.message == "Invalid user credential" &&
                                      mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(e.message),
                                      ),
                                    );
                                  } else if (e is AuthException && mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(e.message),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(e.toString()),
                                      ),
                                    );
                                  }
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
              ),
            ),
    );
  }
}
