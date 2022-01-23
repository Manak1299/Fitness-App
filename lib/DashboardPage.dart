import 'package:fitness_app/full_body.dart';
import 'package:fitness_app/utils/Themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  ScrollController _scrollController;

  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: isShrink
                    ? LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[Colors.white, Colors.white],
                      )
                    : LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[Color(0xFF4CA3FE), Color(0xFF007CFE)],
                      ),
              ),
            ),
            leading: IconButton(
              color: isShrink ? Colors.black : Colors.white,
              icon: Icon(Icons.menu),
              onPressed: () {
                print("This is icon button");
              },
              iconSize: 30,
            ),
            elevation: 0.0,
            title: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "HOME",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isShrink ? Colors.blue : Colors.white,
                      fontSize: 22),
                ),
                TextSpan(
                  text: " WORKOUT",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isShrink ? Colors.black : Colors.white,
                      fontSize: 22),
                ),
              ]),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("images/gift.png"),
              )
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Stack(children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Color(0xFF4CA3FE), Color(0xFF007CFE)],
                )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "10",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                          Text(
                            "WORKOUT",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "41",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                          Text(
                            "KCAL",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "2",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                          Text(
                            "MINUTES",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 80, left: 20, right: 20),
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 16, bottom: 12),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "WEEK GOAL",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 30, bottom: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Set weekly goals for a better body shape",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        height: 55.0,
                        child: RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF4CA3FE),
                                    Color(0xFF007CFE)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 300.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "SET A GOAL",
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
                    ],
                  )),
            ]),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "7X4 CHALLENGE",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"),
              ),
            ),
            GestureDetector(
              child: WorkoutCard(
                title: "FULL BODY",
                subTitle: "7X4 CHALLENGE",
                image: "images/image1.jpg",
                progressBar: true,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FullBodyWorkout();
                }));
              },
            ),
            WorkoutCard(
              title: "LOWER BODY",
              subTitle: "7X4 CHALLENGE",
              image: "images/lowerbody.jpg",
              progressBar: false,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Container(
                      width: 56,
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFF004DFE),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "HOT",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto",
                              color: Colors.white),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "QUARANTINE AT HOME",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                        color: Colors.grey[900]),
                  ),
                ),
              ],
            ),
            WorkoutCard(
                title: "BEST QUARANTINE\nWORKOUT",
                subTitle: "5 WORKOUTS",
                image: "images/image3.webp",
                progressBar: false),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "BEGINNER",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"),
              ),
            ),
            IndividualWorkoutCard(
              title: "ABS BEGINNER",
              image: "images/abs.jpg",
              iconColor1: Color(0xFF004DFE),
              iconColor2: Colors.white30,
              iconColor3: Colors.white30,
            ),
            IndividualWorkoutCard(
              title: "CHEST BEGINNER",
              image: "images/chest.jpg",
              iconColor1: Color(0xFF004DFE),
              iconColor2: Colors.white30,
              iconColor3: Colors.white30,
            ),
            IndividualWorkoutCard(
              title: "ARM BEGINNER",
              image: "images/arms.jpg",
              iconColor1: Color(0xFF004DFE),
              iconColor2: Colors.white30,
              iconColor3: Colors.white30,
            ),
            IndividualWorkoutCard(
              title: "LEG BEGINNER",
              image: "images/leg.jpg",
              iconColor1: Color(0xFF004DFE),
              iconColor2: Colors.white30,
              iconColor3: Colors.white30,
            ),
            IndividualWorkoutCard(
              title: "SHOULDER AND BACK BEGINNER",
              image: "images/backandshoulder.jpg",
              iconColor1: Color(0xFF004DFE),
              iconColor2: Colors.white30,
              iconColor3: Colors.white30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "INTERMEDIATE",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"),
              ),
            ),
            IndividualWorkoutCard(
              title: "ABS INTERMEDIATE",
              image: "images/abs.jpg",
              iconColor1: Color(0xFF004DFE),
              iconColor2: Color(0xFF004DFE),
              iconColor3: Colors.white30,
            ),
            IndividualWorkoutCard(
              title: "CHEST INTERMEDIATE",
              image: "images/chest.jpg",
              iconColor1: Color(0xFF004DFE),
              iconColor2: Color(0xFF004DFE),
              iconColor3: Colors.white30,
            ),
            IndividualWorkoutCard(
              title: "ARM INTERMEDIATE",
              image: "images/arms.jpg",
              iconColor1: Color(0xFF004DFE),
              iconColor2: Color(0xFF004DFE),
              iconColor3: Colors.white30,
            ),
            IndividualWorkoutCard(
              title: "LEG INTERMEDIATE",
              image: "images/leg.jpg",
              iconColor1: Color(0xFF004DFE),
              iconColor2: Color(0xFF004DFE),
              iconColor3: Colors.white30,
            ),
            IndividualWorkoutCard(
              title: "SHOULDER AND BACK INTERMEDIATE",
              image: "images/backandshoulder.jpg",
              iconColor1: Color(0xFF004DFE),
              iconColor2: Color(0xFF004DFE),
              iconColor3: Colors.white30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "ADVANCED",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"),
              ),
            ),
            IndividualWorkoutCard(
              title: "ABS ADVANCED",
              image: "images/abs.jpg",
              iconColor1: Color(0xFF004DFE),
              iconColor2: Color(0xFF004DFE),
              iconColor3: Color(0xFF004DFE),
            ),
            IndividualWorkoutCard(
              title: "CHEST ADVANCED",
              image: "images/chest.jpg",
              iconColor1: Color(0xFF004DFE),
              iconColor2: Color(0xFF004DFE),
              iconColor3: Color(0xFF004DFE),
            ),
            IndividualWorkoutCard(
              title: "ARM ADVANCED",
              image: "images/arms.jpg",
              iconColor1: Color(0xFF004DFE),
              iconColor2: Color(0xFF004DFE),
              iconColor3: Color(0xFF004DFE),
            ),
            IndividualWorkoutCard(
              title: "LEG ADVANCED",
              image: "images/leg.jpg",
              iconColor1: Color(0xFF004DFE),
              iconColor2: Color(0xFF004DFE),
              iconColor3: Color(0xFF004DFE),
            ),
            IndividualWorkoutCard(
              title: "SHOULDER AND BACK ADVANCED",
              image: "images/backandshoulder.jpg",
              iconColor1: Color(0xFF004DFE),
              iconColor2: Color(0xFF004DFE),
              iconColor3: Color(0xFF004DFE),
            ),
          ])),
        ],
      ),
    );
  }
}

class IndividualWorkoutCard extends StatelessWidget {
  final String image;
  final String title;
  final Color iconColor1;
  final Color iconColor2;
  final Color iconColor3;

  IndividualWorkoutCard(
      {this.image,
      this.title,
      this.iconColor1,
      this.iconColor2,
      this.iconColor3});

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            margin: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
                scale: 2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Themes.test_style,
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.bolt,
                      color: iconColor1,
                      size: 35,
                    ),
                    Icon(
                      Icons.bolt,
                      color: iconColor2,
                      size: 35,
                    ),
                    Icon(
                      Icons.bolt,
                      color: iconColor3,
                      size: 35,
                    ),
                  ],
                )
              ],
            ),
          ),
        ]);
  }
}

class WorkoutCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final bool progressBar;

  WorkoutCard({this.title, this.subTitle, this.image, this.progressBar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                    color: Colors.white),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                subTitle,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                    color: Colors.white),
              ),
              Spacer(),
              progressBar
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "21",
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 20),
                                  ),
                                  TextSpan(
                                    text: " Days Left",
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 16),
                                  ),
                                ]),
                              ),
                              Spacer(),
                              Text("25%",
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: 20))
                            ],
                          ),
                        ),
                        new LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width - 40,
                          animation: true,
                          lineHeight: 5.0,
                          animationDuration: 2000,
                          percent: 0.25,
                          linearStrokeCap: LinearStrokeCap.butt,
                          progressColor: Color(0xFF004DFE),
                          backgroundColor: Colors.white30,
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );

    /*return Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            margin: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
                scale: 2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      color: Colors.white),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                progressBar
                    ? new LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 50,
                        animation: true,
                        lineHeight: 10.0,
                        animationDuration: 2000,
                        percent: 0.25,
                        linearStrokeCap: LinearStrokeCap.butt,
                        progressColor: Color(0xFF004DFE),
                      )
                    : Text(""),
              ],
            ),
          ),
        ]);*/
  }
}

class CurvePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xFF3d2858);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    var path = Path();
    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}

/*
Row(
children: [
Text(
"HOME",
style: TextStyle(
fontWeight: FontWeight.bold,
color: isShrink ? Colors.blue : Colors.white),
),
SizedBox(
width: 5,
),
Text(
"WORKOUT",
style: TextStyle(
fontWeight: FontWeight.bold,
color: isShrink ? Colors.black : Colors.white),
),
],
)*/
