import 'package:firebase_learn/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 

      Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome back Nigga"),
          Expanded(child: MyTextField(labelText: "Email")),
          Expanded(child: MyTextField(labelText: "Password")),
        ],
      ),)

    ,);
  }
}