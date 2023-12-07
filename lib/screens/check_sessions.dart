import 'package:event_management_app/services/auth.dart';
import 'package:event_management_app/screens/home_screen.dart';
import 'package:event_management_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class CheckSessions extends StatefulWidget {
  const CheckSessions({super.key});

  @override
  State<CheckSessions> createState() => _CheckSessionsState();
}

class _CheckSessionsState extends State<CheckSessions> {
  @override
  void initState() {
    checkSessions().then((value) {
      if (value) {
        Future.delayed(
            const Duration(seconds: 2),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen())));
      } else {
        Future.delayed(
            const Duration(seconds: 2),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginScreen())));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
