import 'package:flutter/material.dart';
import 'package:flutter_uas_simple_recipe_keeper_c14220002/auth/auth_gate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isFirstTime', false);
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AuthGate()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Simple Recipe Keeper",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
                const SizedBox(height: 24),
                Image.network(
                  'https://yt3.googleusercontent.com/ytc/AIdro_nsxAqLlfwQqf0mIZN5O4Iza534xr10u0ZJzh1t102Q3nc=s900-c-k-c0x00ffffff-no-rj',
                  height: 250,
                ),
                const SizedBox(height: 32),
                const CircularProgressIndicator(color: Colors.deepOrange),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
