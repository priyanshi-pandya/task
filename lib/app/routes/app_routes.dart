import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      case '/ViewRequired':
        return MaterialPageRoute(
          builder: (context) => const ViewRequired(),
        );
      case '/MyAvailable':
        return MaterialPageRoute(
          builder: (context) => const MyAvailable(),
        );
    }
  }
}
