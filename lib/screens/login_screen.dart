import 'package:event_management_app/services/auth.dart';
import 'package:event_management_app/screens/home_screen.dart';
import 'package:event_management_app/screens/signup_screen.dart';
import 'package:event_management_app/utils/app_colors.dart';
import 'package:event_management_app/widgets/custom_input_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Text(
              "Login",
              style: TextStyle(
                  color: kLightBlue, fontSize: 32, fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomInputForm(
                controller: _emailController,
                icon: Icons.email,
                label: "Email",
                hint: "Enter Your Email"),
            const SizedBox(
              height: 8,
            ),
            CustomInputForm(
                controller: _passwordController,
                obscureText: true,
                icon: Icons.lock,
                label: "Password",
                hint: "Enter Your Password"),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot Password",
                  style: TextStyle(
                      color: kLightBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  loginUser(_emailController.text.trim(),
                          _passwordController.text.trim())
                      .then((value) {
                    if (value) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Login Successfully..")));

                      Future.delayed(
                          const Duration(seconds: 2),
                          () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen())));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Login Failed Try Again...")));
                    }
                  });
                },
                style: OutlinedButton.styleFrom(
                    foregroundColor: kLightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text("Login"),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create a New Account ?",
                    style: TextStyle(
                        color: kLightBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        color: kLightBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
