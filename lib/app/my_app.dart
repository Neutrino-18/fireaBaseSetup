import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/screens/home_screen.dart';
import 'package:firebase_learn/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.idTokenChanges(),
        builder: (context, asyncSnapshot) {
          print("hello");
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if(asyncSnapshot.hasData){
            print(asyncSnapshot.data);
            return HomeScreen();
          }
          print("hi");
          return SignupScreen();
        },
      ),
    );
  }
}
