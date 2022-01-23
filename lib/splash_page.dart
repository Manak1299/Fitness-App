import 'dart:async';

import 'package:flutter/material.dart';

import 'DashboardPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToNextPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DashboardPage();
    }));
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 10);
    return new Timer(_duration, navigateToNextPage);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Container(
          child: Image(
            image: AssetImage(
              'images/spash1.jpg',
            ),
            fit: BoxFit.fitHeight,
          ),
        ),
        Container(
          child: Image.asset(
            'images/splash3.png',
            scale: 8.0,
            color: Colors.white,
            alignment: Alignment.bottomCenter,
          ),
        ),
      ],
    );
  }
}
