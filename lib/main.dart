import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/constants/color.dart';
import 'app/routes/app_routes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: TColors.buttonColor),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task',
      initialRoute: '/',
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
