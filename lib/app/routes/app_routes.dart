import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/authentication/login.dart';
import '../../screens/authentication/signup.dart';
import '../../screens/dashboard/ViewAvailable.dart';
import '../../screens/dashboard/dashboard.dart';

class AppRoute {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case '/SignUpScreen':
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      case '/DashboardScreen':
        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        );
      case '/ViewAvailable':
        return MaterialPageRoute(
          builder: (context) => const ViewAvailable(),
        );
    }
  }
}
