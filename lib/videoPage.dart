import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0062FE),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 45,
                    height: 10,
                    color: Color(0xFFAAC5E2),
                  ),
                  Container(
                    width: 45,
                    height: 10,
                    color: Color(0xFFAAC5E2),
                  ),
                  Container(
                    width: 45,
                    height: 10,
                    color: Color(0xFFAAC5E2),
                  ),
                  Container(
                    width: 45,
                    height: 10,
                    color: Color(0xFFAAC5E2),
                  ),
                  Container(
                    width: 45,
                    height: 10,
                    color: Color(0xFFAAC5E2),
                  ),
                  Container(
                    width: 45,
                    height: 10,
                    color: Color(0xFFAAC5E2),
                  ),
                  Container(
                    width: 45,
                    height: 10,
                    color: Color(0xFFAAC5E2),
                  ),
                  Container(
                    width: 45,
                    height: 10,
                    color: Color(0xFFAAC5E2),
                  ),
                  Container(
                    width: 45,
                    height: 10,
                    color: Color(0xFFAAC5E2),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              child: Row(
                children: [
                  BackButton(
                    color: Colors.white,
                  ),
                  Spacer(),
                  Icon(
                    Icons.photo_sharp,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "ANIMATION",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 300,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "JUMPING JACKS 20",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22),
                    ),
                    TextSpan(
                      text: "s",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22),
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
