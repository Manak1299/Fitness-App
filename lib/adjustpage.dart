import 'package:flutter/material.dart';

class AdjustPage extends StatefulWidget {
  @override
  _AdjustPageState createState() => _AdjustPageState();
}

class _AdjustPageState extends State<AdjustPage> {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  bool isPressed4 = false;
  bool isEnabled = false;
  sampleFunction() {
    print('Clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: BackButton(
              color: Colors.black,
            ),
          ),
          CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage(
                "https://www.mykhel.com/img/2020/03/viratkohli-1584528869.jpg"),
            backgroundColor: Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Tell your coach...",
              style: TextStyle(fontSize: 22, color: Colors.black54),
            ),
          ),
          Text(
            "How would you like to adjust\n                  your plan?",
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = true;
                isPressed2 = false;
                isPressed3 = false;
                isPressed4 = false;
                isEnabled = true;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[350]),
                  borderRadius: BorderRadius.circular(10),
                  color: isPressed1 ? Color(0xFF006CFE) : Color(0xFFF3F3F3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Much easier",
                      style: TextStyle(
                          fontSize: 22,
                          color: isPressed1 ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = false;
                isPressed2 = true;
                isPressed3 = false;
                isPressed4 = false;
                isEnabled = true;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[350]),
                  borderRadius: BorderRadius.circular(10),
                  color: isPressed2 ? Color(0xFF006CFE) : Color(0xFFF3F3F3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "A little easier",
                      style: TextStyle(
                          fontSize: 22,
                          color: isPressed2 ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = false;
                isPressed2 = false;
                isPressed3 = true;
                isPressed4 = false;
                isEnabled = true;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[350]),
                  borderRadius: BorderRadius.circular(10),
                  color: isPressed3 ? Color(0xFF006CFE) : Color(0xFFF3F3F3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "A little harder",
                      style: TextStyle(
                          fontSize: 22,
                          color: isPressed3 ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPressed1 = false;
                isPressed2 = false;
                isPressed3 = false;
                isPressed4 = true;
                isEnabled = true;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[350]),
                  borderRadius: BorderRadius.circular(10),
                  color: isPressed4 ? Color(0xFF006CFE) : Color(0xFFF3F3F3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Much harder",
                      style: TextStyle(
                          fontSize: 22,
                          color: isPressed4 ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: RaisedButton(
              onPressed: isEnabled ? sampleFunction : null,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isEnabled
                          ? [Color(0xFF006CFE), Color(0xFF0054FE)]
                          : [Color(0xCC006CFE), Color(0xCC0054FE)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: double.infinity, minHeight: 58.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Done",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: Colors.grey[350])),
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: double.infinity, minHeight: 58.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Cancel",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
