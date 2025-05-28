import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_learn/app/my_app.dart';
import 'package:firebase_learn/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
