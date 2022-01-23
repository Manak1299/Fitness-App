import 'package:flutter/material.dart';

class QuitPage extends StatefulWidget {
  @override
  _QuitPageState createState() => _QuitPageState();
}

class _QuitPageState extends State<QuitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF2006CFE),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: BackButton(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Quit",
                  style: TextStyle(
                      fontSize: 38,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              height: 110,
              width: double.infinity,
              child: RaisedButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Just take a look",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                color: Color(0x26006CFE),
                onPressed: () {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              height: 110,
              width: double.infinity,
              child: RaisedButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Too hard",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                color: Color(0x26006CFE),
                onPressed: () {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              height: 110,
              width: double.infinity,
              child: RaisedButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Don't know how to do it",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                color: Color(0x26006CFE),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Quit",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
