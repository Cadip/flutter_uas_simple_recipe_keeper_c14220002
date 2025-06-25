import 'package:flutter/material.dart';
import 'package:flutter_uas_simple_recipe_keeper_c14220002/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/pages/get_started_page.dart';
import '/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/.env');

  await Supabase.initialize(
    url: dotenv.env['NEXT_PUBLIC_SUPABASE_URL']!,
    anonKey: dotenv.env['NEXT_PUBLIC_SUPABASE_ANON_KEY']!,
  );

  final prefs = await SharedPreferences.getInstance();
  final isFirstTime = prefs.getBool('isFirstTime') ?? true;
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MainApp(isFirstTime: isFirstTime, isLoggedIn: isLoggedIn));
}

class MainApp extends StatelessWidget {
  final bool isFirstTime;
  final bool isLoggedIn;

  const MainApp({
    super.key,
    required this.isFirstTime,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    Widget home;

    if (isFirstTime) {
      home = const GetStartedPage();
    } else if (isLoggedIn) {
      home = const AuthGate();
    } else {
      home = const LoginPage(); 
    }

    return MaterialApp(debugShowCheckedModeBanner: false, home: home);
  }
}
