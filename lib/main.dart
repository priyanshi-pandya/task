import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task/store/supabase_service.dart';
import 'app/constants/color.dart';
import 'app/routes/app_routes.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://hewgtujypofrcryzaiuu.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhld2d0dWp5cG9mcmNyeXphaXV1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM0MTI1MDgsImV4cCI6MjAwODk4ODUwOH0.Zx29tQZovVgJR6vaa3rbau_nqHztZHHt2h0u1o3FgVc',
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: TColors.buttonColor),
  );
  runApp(const MyApp());
}

var supabase = Supabase.instance.client;

final supabaseService = SupabaseService();

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
