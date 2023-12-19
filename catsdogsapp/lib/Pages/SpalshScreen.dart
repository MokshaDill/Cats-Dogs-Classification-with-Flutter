import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:catsdogsapp/Pages/HomePage.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      setStateTimer: Duration(microseconds: 20),
      nextScreen: Homepage(),
      splashScreenBody: Text('Animal Classifier'),
      

    );
  }
}
