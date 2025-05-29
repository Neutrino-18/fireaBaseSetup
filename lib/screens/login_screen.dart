import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/screens/home_screen.dart';
import 'package:firebase_learn/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final contactController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoggingIn = false;

  Future<void> loginWithFirebase() async {
    try {
      final creds = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      print(creds);

      if (creds.user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const HomeScreen()),
        );
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
              "Welcome back !!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),

            MyTextField(
              labelText: "Name",
              controller: nameController,
              keyboardType: TextInputType.name,
            ),
            MyTextField(
              labelText: "Phone",
              controller: contactController,
              keyboardType: TextInputType.phone,
            ),
            MyTextField(
              labelText: "Email",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),

            MyTextField(
              labelText: "Password",

              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              isPassword: true,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                isLoggingIn = true;
                await loginWithFirebase();
              },
              child: isLoggingIn? const CircularProgressIndicator() : const Text("Login Nigga"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    contactController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
