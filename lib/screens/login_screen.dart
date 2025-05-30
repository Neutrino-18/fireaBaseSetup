import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/screens/home_screen.dart';
import 'package:firebase_learn/screens/signup_screen.dart';
import 'package:firebase_learn/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _loginWithFirebase() async {
    try {
      final userCreds = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (userCreds.user != null) {
        if (context.mounted) {
          Navigator.of(
            context,
          ).pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
        }
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Welcome Back !!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),

            MyTextField(
              labelText: "Email",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),

            MyTextField(
              id: 'login',
              labelText: "Password",
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              isPassword: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (ctx) => SignupScreen()),
                    );
                  },
                  child: Text("Don't have an account?"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                await _loginWithFirebase();
              },
              child: const Text("Login Nigga"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
