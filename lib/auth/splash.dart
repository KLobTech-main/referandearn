import 'dart:async';

import 'package:flutter/material.dart';
import 'package:referandearn/auth/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    checkUserPreference();
  }

  Future<void> checkUserPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? selectedMode = prefs.getString('selectedMode');

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignupScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: _opacity,
        child: Center(
          child: SizedBox(
            height: screenHeight * 0.5,
            width: screenWidth * 0.7,
            // child: Image.asset(
            //   'images/fix.jpg',
            //   fit: BoxFit.contain,
            // ),
          ),
        ),
      ),
    );
  }
}
