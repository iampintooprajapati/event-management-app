import 'package:event_management_app/services/auth.dart';
import 'package:event_management_app/screens/login_screen.dart';
import 'package:event_management_app/services/shared_preferences.dart';
import 'package:event_management_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "User";

  @override
  void initState() {
    userName = SaveSharedPreferences.getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                logoutUser();
                Future.delayed(
                    const Duration(seconds: 2),
                    () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen())));
              },
              icon: const Icon(
                Icons.logout,
                color: kLightBlue,
                size: 30,
              ))
        ],
      ),
      body: Text(
        "Hi $userName 👋",
        style: const TextStyle(
            color: kLightBlue, fontSize: 32, fontWeight: FontWeight.w600),
      ),
    );
  }
}
