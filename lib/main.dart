import 'package:api_integration/Home_screen.dart';
import 'package:api_integration/Last_Example.dart';
import 'package:api_integration/PostMathod/Image_Upload.dart';
import 'package:api_integration/PostMathod/SignUp.dart';
import 'package:api_integration/example_four.dart';
import 'package:api_integration/example_three.dart';
import 'package:api_integration/example_two.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UpaloadImage(),
    );
  }
}

