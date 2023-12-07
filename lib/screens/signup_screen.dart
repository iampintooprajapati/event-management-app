import 'package:event_management_app/services/auth.dart';
import 'package:event_management_app/screens/login_screen.dart';
import 'package:event_management_app/utils/app_colors.dart';
import 'package:event_management_app/widgets/custom_input_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
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
              "Sign Up",
              style: TextStyle(
                  color: kLightBlue, fontSize: 32, fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomInputForm(
                controller: _nameController,
                icon: Icons.person,
                label: "Name",
                hint: "Enter Your Name"),
            const SizedBox(
              height: 8,
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
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  createUser(
                          _nameController.text.trim(),
                          _emailController.text.trim(),
                          _passwordController.text.trim())
                      .then((value) {
                    if (value == "success") {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Account Created")));
                      Future.delayed(
                          const Duration(seconds: 2),
                          () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen())));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));
                    }
                  });
                },
                style: OutlinedButton.styleFrom(
                    foregroundColor: kLightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text("Sign Up"),
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
                        builder: (context) => const LoginScreen()));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        color: kLightBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Login",
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
