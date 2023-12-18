import 'package:flutter/material.dart';

import 'Pages/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cat & Dog Classifier',
      home: splashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
