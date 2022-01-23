import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:fitness_app/quitPage.dart';
import 'package:fitness_app/videoPage.dart';
import 'package:flutter/material.dart';
import 'package:simple_timer/simple_timer.dart';

class WorkoutStartPage extends StatefulWidget {
  @override
  _WorkoutStartPageState createState() => _WorkoutStartPageState();
}

class _WorkoutStartPageState extends State<WorkoutStartPage>
    with SingleTickerProviderStateMixin {
  bool iscompleted = false;
  bool isLIked = false;
  bool isDisliked = false;
  TimerController _timerController;
  TimerStatus timerStatus;
  TimerStatus resettimerStatus;
  bool isSwitched = false;
  bool isSwitched2 = false;
  bool isgifPaused = false;
  bool ispause = false;
  String imagePath;
  String exerciseName;
  String shouldResume;
  bool editing = false;
  bool isreset = false;
  String buttonText = "PAUSE";
  @override
  void initState() {
    _timerController = TimerController(this);
    timerStatus = TimerStatus.start;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                fit: StackFit.passthrough,
                children: [
                  isgifPaused
                      ? Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Image.asset(
                            "images/gif_paused.jpg",
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Image.asset(
                            "${imagePath = "images/exercise1.gif"}",
                          ),
                        ),
                  Container(
                    color: Colors.grey,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40,
                              child: BackButton(
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black12,
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return VideoPage();
                              }));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 35,
                                height: 60,
                                child: Center(
                                    child: Icon(
                                  Icons.video_call,
                                  color: Colors.white,
                                )),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 35,
                              height: 60,
                              child: InkWell(
                                onTap: () {
                                  print("test");
                                  soundDialog();
                                },
                                child: Center(
                                    child: Icon(
                                  Icons.volume_up_sharp,
                                  color: Colors.white,
                                )),
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 200,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("like");
                              setState(() {
                                isLIked = true;
                                isDisliked = false;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 35,
                                height: 60,
                                child: Center(
                                    child: Icon(
                                  Icons.thumb_up_alt_sharp,
                                  color: Colors.white,
                                )),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isLIked
                                      ? Color(0xFF0054FE)
                                      : Colors.black12,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("dislike");
                              setState(() {
                                isLIked = false;
                                isDisliked = true;
                                isgifPaused = true;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 35,
                                height: 60,
                                child: Center(
                                    child: Icon(
                                  Icons.thumb_down_alt_sharp,
                                  color: Colors.white,
                                )),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isDisliked
                                      ? Color(0xFF0054FE)
                                      : Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  isDisliked
                      ? Container(
                          width: double.infinity,
                          height: 400,
                          color: Colors.white.withOpacity(0.8),
                          child: Column(
                            children: [
                              Text(
                                "What makes you feel bad?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    /*
                                    timerStatus = TimerStatus.start;
                                    ispause = false;*/
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0)),
                                padding: EdgeInsets.all(0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  constraints: BoxConstraints(
                                      maxWidth: 300.0, minHeight: 60.0),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Too Hard",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    /*
                                    timerStatus = TimerStatus.start;
                                    ispause = false;*/
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0)),
                                padding: EdgeInsets.all(0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  constraints: BoxConstraints(
                                      maxWidth: 300.0, minHeight: 60.0),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't know how to do it",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    /*
                                    timerStatus = TimerStatus.start;
                                    ispause = false;*/
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0)),
                                padding: EdgeInsets.all(0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  constraints: BoxConstraints(
                                      maxWidth: 300.0, minHeight: 60.0),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Get Injured",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    isDisliked = false;
                                    isgifPaused = false;
                                  });
                                  print(isDisliked);
                                  final snackBar = SnackBar(
                                    backgroundColor: Colors.white,
                                    content: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.check_circle,
                                            color: Colors.greenAccent[700],
                                          ),
                                        ),
                                        Text(
                                          "Thanks for your feedback! We'll do our \nbest to bring a better user experience",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0)),
                                padding: EdgeInsets.all(0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  constraints: BoxConstraints(
                                      maxWidth: 300.0, minHeight: 60.0),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Done",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF0054FE),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [],
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              iscompleted
                  ? Text("")
                  : Text(
                      "READY TO GO!",
                      style: TextStyle(
                          fontSize: 34,
                          color: Color(0xFF0054FE),
                          fontWeight: FontWeight.w900),
                    ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${exerciseName = "JUMPING JACKS"}",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.w900),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return VideoPage();
                        }));
                      },
                      child: Icon(Icons.help_outline_rounded))
                ],
              ),
              iscompleted
                  ? Column(
                      children: [
                        Container(
                          height: 150,
                          child: SimpleTimer(
                            progressIndicatorColor: Colors.white,
                            backgroundColor: Colors.white,
                            status:
                                timerStatus, //isreset ? resettimerStatus : timerStatus,
                            progressTextStyle: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 100),
                            strokeWidth: 0.0,
                            duration: Duration(seconds: 15),
                          ),
                        ),
                        Container(
                          width: 300,
                          child: isreset
                              ? RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      timerStatus = TimerStatus.start;
                                      ispause = false;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0)),
                                  padding: EdgeInsets.all(0.0),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF006CFE),
                                            Color(0xFF0054FE)
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: 350.0, minHeight: 60.0),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.pause,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "START",
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
                                )
                              : RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (ispause == false) {
                                        timerStatus = TimerStatus.pause;
                                        ispause = true;
                                        isgifPaused = true;
                                      }
                                    });

                                    Navigator.of(context).push(PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder: (_, __, ___) =>
                                          // ignore: missing_return
                                          PausePage((value) {
                                        setState(() {
                                          return shouldResume = value;
                                        });

                                        if (shouldResume == "yes") {
                                          setState(() {
                                            isreset = false;
                                            ispause = false;

                                            isgifPaused = false;
                                            shouldResume = "no";
                                          });
                                        } else if (shouldResume == "no") {
                                          setState(() {
                                            isreset = true;
                                            ispause = false;
                                            buttonText = "START";
                                            timerStatus = TimerStatus.reset;
                                            isgifPaused = false;
                                            shouldResume = "yes";
                                          });
                                        }
                                        /*if (ispause) {
                                          timerStatus = TimerStatus.start;
                                        } else {
                                          //  timerStatus = TimerStatus.reset;
                                          if (buttonText == "START") {
                                            timerStatus = TimerStatus.start;
                                          }
                                        }*/

                                        /*  if (shouldResume == "yes") {
                                        //RESUME
                                        setState(() {
                                          isTimerPaused = false;
                                          isgifPaused = false;
                                          timerStatus = TimerStatus.start;
                                          print(
                                              "isTimerPauser == $isTimerPaused");
                                        });
                                      }
                                      else if (shouldResume == "no") {
                                        //RESTART
                                        print("else if shouldResume = $shouldResume");
                                        print("else if isTimerPaused3 =$isTimerPaused");

                                        if (isTimerPaused == false) {
                                          setState(() {
                                            isTimerPaused = false;
                                            timerStatus = TimerStatus.start;
                                          });
                                        }
                                      }*/
                                      }, imagePath, exerciseName),
                                    ));
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0)),
                                  padding: EdgeInsets.all(0.0),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF006CFE),
                                            Color(0xFF0054FE)
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: 350.0, minHeight: 60.0),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.pause,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            buttonText,
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
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularCountDownTimer(
                          width: 130.0,
                          ringColor: Color(0xFF0054FE),
                          fillColor: Colors.white,
                          textStyle: TextStyle(
                              fontSize: 33.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w900),
                          autoStart: true,
                          initialDuration: 0,
                          strokeWidth: 15.0,
                          isReverseAnimation: true,
                          onComplete: () {
                            setState(() {
                              print("test");
                              iscompleted = true;
                            });
                          },
                          duration: 15,
                          height: 200,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                iscompleted = true;
                              });
                            },
                            child: Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.skip_previous_outlined,
                          color: Colors.grey,
                          size: 30,
                        ),
                        Text(
                          "Previous",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 22,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 25,
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.skip_next_outlined,
                          color: Colors.grey,
                          size: 30,
                        ),
                        Text(
                          "Next",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 22,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future soundDialog() {
    return showDialog(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return AlertDialog(
              scrollable: true,
              title: Text(
                'Sound options',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              content: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.volume_up,
                        color: Colors.grey[600],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                          width: 150,
                          child: Text(
                            "Mute",
                            style: TextStyle(fontSize: 20),
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Switch(
                        activeColor: Color(0xFF004AFE),
                        activeTrackColor: Color(0xFFADC8FE),
                        inactiveThumbColor: Color(0xFFEBEBEB),
                        inactiveTrackColor: Color(0xFFB1B1B1),
                        onChanged: (bool value) {
                          if (isSwitched == false) {
                            setState(() {
                              isSwitched = true;
                              isSwitched2 = false;
                            });
                          } else {
                            setState(() {
                              isSwitched = false;
                              isSwitched2 = true;
                            });
                          }
                        },
                        value: isSwitched,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.graphic_eq, color: Colors.grey[600]),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                          width: 150,
                          child: Text(
                            "Voice guide",
                            style: TextStyle(fontSize: 20),
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Switch(
                        activeColor: Color(0xFF004AFE),
                        activeTrackColor: Color(0xFFADC8FE),
                        inactiveThumbColor: Color(0xFFEBEBEB),
                        inactiveTrackColor: Color(0xFFB1B1B1),
                        onChanged: (bool value) {
                          if (isSwitched2 == false) {
                            setState(() {
                              isSwitched = false;
                              isSwitched2 = true;
                            });
                          } else {
                            setState(() {
                              isSwitched = true;
                              isSwitched2 = false;
                            });
                          }
                        },
                        value: isSwitched2,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.record_voice_over, color: Colors.grey[600]),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                          width: 150,
                          child: Text(
                            "Coach tips",
                            style: TextStyle(fontSize: 20),
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Switch(
                        activeColor: Color(0xFF004AFE),
                        activeTrackColor: Color(0xFFADC8FE),
                        inactiveThumbColor: Color(0xFFEBEBEB),
                        inactiveTrackColor: Color(0xFFB1B1B1),
                        onChanged: (bool value) {
                          if (isSwitched2 == false) {
                            setState(() {
                              isSwitched = false;
                              isSwitched2 = true;
                            });
                          } else {
                            setState(() {
                              isSwitched = true;
                              isSwitched2 = false;
                            });
                          }
                        },
                        value: isSwitched2,
                      ),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'OK',
                    style: TextStyle(color: Color(0xFF004AFE), fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<bool> _onBackPressed() async {
    print("!@@@@@@@");
    Container(
      child: QuitPage(),
    );
    return true;
    /*if (!widget.editing) {
      Navigator.pop(context, true);
      return Future.value(false);
    } else {
      return showDialog();
    }*/
  }
}

/*
CircularPercentIndicator(
radius: 150.0,
lineWidth: 13.0,
animation: true,
reverse: true,
percent: 0.1,
center: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
new Text(
"10",
style: new TextStyle(
fontWeight: FontWeight.bold,
fontSize: 50.0,
color: Colors.black,
),
),
],
),
circularStrokeCap: CircularStrokeCap.butt,
progressColor: Color(0xFF0054FE),
backgroundColor: Color(0xFFEDEDED),
),*/
typedef StringValue = String Function(String);

class PausePage extends StatefulWidget {
  StringValue callback;
  String imagePath;
  String exerciseName;
  PausePage(this.callback, this.imagePath, this.exerciseName);
  @override
  _PausePageState createState() => _PausePageState();
}

class _PausePageState extends State<PausePage> {
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
                onPressed: () {
                  widget.callback("yes");
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pause",
                          style: TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.exerciseName,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w900),
                            ),
                            Icon(
                              Icons.help_outlined,
                              color: Colors.white70,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        widget.imagePath,
                        scale: 8,
                      ),
                    ),
                  ),
                ],
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
                    "RESTART THE EXERCISE",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                color: Color(0x26006CFE),
                onPressed: () {
                  widget.callback("no");
                  Navigator.pop(context);
                },
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
                    "QUIT",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                color: Color(0x26006CFE),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              height: 110,
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "RESUME",
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xF2006CFE),
                        fontWeight: FontWeight.w900),
                  ),
                ),
                color: Colors.white,
                onPressed: () {
                  widget.callback("yes");
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
