import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/screens/authentication/forgot_password.dart';
import 'package:task/screens/dashboard/view_required.dart';

import '../../screens/authentication/login.dart';
import '../../screens/authentication/signup.dart';
import '../../screens/dashboard/my_available.dart';
import '../../screens/dashboard/view_available.dart';
import '../../screens/dashboard/dashboard.dart';

class AppRoute {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case '/LoginScreen':
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case '/SignUpScreen':
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case '/DashboardScreen':
        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        );
      case '/ViewAvailable':
        return MaterialPageRoute(
          builder: (context) => const ViewAvailable(),
        );
      case '/ViewRequired':
        return MaterialPageRoute(
          builder: (context) => ViewRequired(),
        );
      case '/MyAvailable':
        return MaterialPageRoute(
          builder: (context) => MyAvailable(),
        );
      case '/ForgotPasswordScreen':
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        );
    }
  }
}
