import 'package:fitness_app/DashboardPage.dart';
import 'package:fitness_app/full_body_test.dart';
import 'package:fitness_app/quitPage.dart';
import 'package:fitness_app/videoPage.dart';
import 'package:fitness_app/workoutStartPage.dart';
import 'package:flutter/material.dart';

import 'adjustpage.dart';
import 'demos/timer_demo.dart';
import 'full_body.dart';
import 'demos/movable_widget_demo.dart';
import 'intermediate_rest_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(),
      // home: TestPagePage(title: 'Simple Timer Widget Demo')(),
    );
  }
}
