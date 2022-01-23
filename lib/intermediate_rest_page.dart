import 'package:fitness_app/videoPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:simple_timer/simple_timer.dart';

class IntermediateRestPage extends StatefulWidget {
  @override
  _IntermediateRestPageState createState() => _IntermediateRestPageState();
}

class _IntermediateRestPageState extends State<IntermediateRestPage> {
  TimerStatus timerStatus;
  int durationTimer = 20;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timerStatus = TimerStatus.start;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF006AFE),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "REST",
            style: TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.w900),
          ),
          StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Column(
                children: [
                  Container(
                    height: 150,
                    child: SimpleTimer(
                      progressIndicatorColor: Color(0xFF006AFE),
                      backgroundColor: Color(0xFF006AFE),
                      status: timerStatus,
                      progressTextStyle: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 200,
                          color: Colors.white),
                      strokeWidth: 0.0,
                      duration: Duration(seconds: durationTimer),
                    ),
                  ),
                ],
              );
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    print("!@@ before durationTimer = $durationTimer");
                    setState(() {
                      durationTimer = durationTimer + 20;
                      timerStatus = TimerStatus.start;
                      /*
                      timerStatus = TimerStatus.start;
                      ispause = false;
*/
                    });

                    print("!@@ after durationTimer = $durationTimer");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0)),
                  padding: EdgeInsets.all(0.0),
                  elevation: 0.0,
                  child: Ink(
                    decoration: BoxDecoration(
                        color: Color(0xB3006AFE),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 110.0, minHeight: 40.0),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "+20s",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      /*
                        timerStatus = TimerStatus.start;
                      ispause = false;
*/
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0)),
                  padding: EdgeInsets.all(0.0),
                  elevation: 0.0,
                  child: Ink(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 110.0, minHeight: 40.0),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Skip",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF006AFE),
                                fontWeight: FontWeight.w900,
                                fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    children: [
                      new LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF006AFE),
                        ),
                        value: 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 12),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "NEXT",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Text(
                              "2/",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF006AFE),
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "11",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF006AFE),
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "INCLINED PUSH-UPS",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            InkWell(
                                onTap: () {
/*
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return VideoPage();
                                  }));
*/
                                },
                                child: Icon(Icons.help_outline_rounded))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "x10",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "images/exercise1.gif",
                    scale: 5,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
