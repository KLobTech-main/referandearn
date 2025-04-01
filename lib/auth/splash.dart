import 'dart:async';

import 'package:flutter/material.dart';
import 'package:referandearn/auth/login.dart';
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
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: "Refer ",
                        style: TextStyle(color: Colors.blue,
                        )),
                    TextSpan(
                        text: "and ",
                        style: TextStyle(color: Colors.green,)),
                    TextSpan(
                        text: "Earn",
                        style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: screenHeight * 0.2,
                width: screenWidth * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Center(
                  child: Icon(
                    Icons.card_giftcard,
                    color: Colors.orangeAccent,
                    size: 80,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}