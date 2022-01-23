import 'package:fitness_app/week_demo.dart';
import 'package:fitness_app/workout_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'models/week_model.dart';
import 'models/workout1model.dart';

class WorkoutTimelinePage extends StatefulWidget {
  @override
  _WorkoutTimelinePageState createState() => _WorkoutTimelinePageState();
}

class _WorkoutTimelinePageState extends State<WorkoutTimelinePage> {
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
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.white,
              expandedHeight: 120.0,
              leading: isShrink
                  ? BackButton(
                      color: Colors.black,
                    )
                  : BackButton(
                      color: Colors.white,
                    ),
              flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(left: 0.0),
                  title: isShrink
                      ? Padding(
                          padding:
                              const EdgeInsets.only(left: 50.0, bottom: 15),
                          child: Text(
                            "7X4 CHALLENGE",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 22),
                          ),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 95.0, left: 40),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "7X4 CHALLENGE",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
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
                                                color: Colors.white60,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          TextSpan(
                                            text: " Days Left",
                                            style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 12),
                                          ),
                                        ]),
                                      ),
                                      Spacer(),
                                      Text("25%",
                                          style: TextStyle(
                                              color: Colors.white60,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14))
                                    ],
                                  ),
                                ),
                                //Indicator
                                new LinearPercentIndicator(
                                  width:
                                      MediaQuery.of(context).size.width - 140,
                                  animation: true,
                                  lineHeight: 4.0,
                                  animationDuration: 2000,
                                  percent: 0.25,
                                  linearStrokeCap: LinearStrokeCap.butt,
                                  progressColor: Color(0xFF004DFE),
                                  backgroundColor: Colors.white30,
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            )
                          ],
                        ),
                  background: Image.asset(
                    "images/image1.jpg",
                    fit: BoxFit.cover,
                  )),
              elevation: 0.0,
            ),
          ];
        },
        body: Container(
          color: Color(0xFFF7F7F7),
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 120 / 60,
                  shrinkWrap: true,
                  children: List.generate(
                    Workout1Model.workoutListItems().length,
                    (index) {
                      if (Workout1Model.workoutListItems()[index].isCompleted) {
                        return TimelineTile(
                          indicatorStyle: IndicatorStyle(
                            width: 25,
                            indicatorXY: 0,
                            color: Color(0xFF007CFE),
                            padding: const EdgeInsets.only(
                                left: 10, top: 16, bottom: 16),
                            iconStyle: IconStyle(
                                iconData: Icons.check,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          beforeLineStyle: const LineStyle(
                            color: Color(0xFF007CFE),
                            thickness: 4,
                          ),
                          endChild: TimeLineTabData(
                            title:
                                "Week ${Workout1Model.workoutListItems()[index].workout_weeks}",
                            days: "7/7",
                            weeksList:
                                Workout1Model.workoutListItems()[index].weeks,
                            isBlue: Workout1Model.workoutListItems()[index]
                                .isCompleted,
                          ),
                        );
                      } else if (Workout1Model.workoutListItems()[index]
                          .isProcessing) {
                        return TimelineTile(
                          indicatorStyle: IndicatorStyle(
                            width: 25,
                            indicatorXY: 0,
                            color: Color(0xFF007CFE),
                            padding: const EdgeInsets.only(
                                left: 10, top: 16, bottom: 16),
                            iconStyle: IconStyle(
                                iconData: Icons.bolt,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          beforeLineStyle: const LineStyle(
                            color: Color(0xFF007CFE),
                            thickness: 4,
                          ),
                          endChild: TimeLineTabData(
                            title:
                                "Week ${Workout1Model.workoutListItems()[index].workout_weeks}",
                            days: "1/7",
                            weeksList:
                                Workout1Model.workoutListItems()[index].weeks,
                            isBlue: Workout1Model.workoutListItems()[index]
                                .isProcessing,
                          ),
                        );
                      } else {
                        return TimelineTile(
                          indicatorStyle: IndicatorStyle(
                            width: 25,
                            indicatorXY: 0,
                            color: Color(0xFFC4C5CA),
                            padding: const EdgeInsets.only(
                                left: 10, top: 16, bottom: 16),
                            iconStyle: IconStyle(
                                iconData: Icons.bolt,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          beforeLineStyle: const LineStyle(
                            color: Color(0xFFC4C5CA),
                            thickness: 4,
                          ),
                          endChild: TimeLineTabData(
                            title:
                                "Week ${Workout1Model.workoutListItems()[index].workout_weeks}",
                            days: "0/7",
                            weeksList:
                                Workout1Model.workoutListItems()[index].weeks,
                            isBlue: Workout1Model.workoutListItems()[index]
                                .isProcessing,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF006CFE), Color(0xFF0054FE)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 350.0, minHeight: 60.0),
                      alignment: Alignment.center,
                      child: Text(
                        "GO!",
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
          ),
        ),
      ),
    );
  }
}

class TimeLineTabData extends StatelessWidget {
  final String title;
  final String days;
  final List<WeekModel> weeksList;
  final bool isBlue;
  TimeLineTabData({this.title, this.days, this.weeksList, this.isBlue});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 40,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        print("Test InkWell Week");
                      },
                      child: Ink(
                        child: Container(
                          child: Text(
                            title,
                            style: TextStyle(
                                fontSize: 20,
                                color:
                                    isBlue ? Color(0xFF007CFE) : Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(days),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: WeekPage(weeksList),
          )
        ],
      ),
    );
  }
}
