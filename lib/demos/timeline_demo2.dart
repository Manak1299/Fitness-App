import 'package:fitness_app/models/week_model.dart';
import 'package:fitness_app/models/workout1model.dart';
import 'package:fitness_app/week_demo.dart';
import 'package:fitness_app/workout_timeline.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineDemo2 extends StatefulWidget {
  @override
  _TimelineDemo2State createState() => _TimelineDemo2State();
}

class _TimelineDemo2State extends State<TimelineDemo2> {
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

/*
  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = widget.item.removeAt(oldindex);
      widget.item.insert(newindex, items);
    });
  }

  void sorting() {
    setState(() {
      widget.item.sort();
    });
  }
*/

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
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  expandedHeight: 150.0,
                  flexibleSpace: FlexibleSpaceBar(
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
                      background: Image.asset(
                        "images/image1.jpg",
                        fit: BoxFit.cover,
                      )),
                  leading: BackButton(
                    color: isShrink ? Colors.black : Colors.white,
                  ),
                  elevation: 0.0,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("images/gift.png"),
                    )
                  ],
                ),
              ];
            },
            body: Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate([
                          Container(
                            color: Color(0xFFF7F7F7),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
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
                                        if (Workout1Model.workoutListItems()[
                                                index]
                                            .isCompleted) {
                                          return TimelineTile(
                                            indicatorStyle: IndicatorStyle(
                                              width: 25,
                                              indicatorXY: 0,
                                              color: Color(0xFF007CFE),
                                              padding: const EdgeInsets.only(
                                                  left: 10,
                                                  top: 16,
                                                  bottom: 16),
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
                                              weeksList: Workout1Model
                                                      .workoutListItems()[index]
                                                  .weeks,
                                              isBlue: Workout1Model
                                                      .workoutListItems()[index]
                                                  .isCompleted,
                                            ),
                                          );
                                        } else if (Workout1Model
                                                .workoutListItems()[index]
                                            .isProcessing) {
                                          return TimelineTile(
                                            indicatorStyle: IndicatorStyle(
                                              width: 25,
                                              indicatorXY: 0,
                                              color: Color(0xFF007CFE),
                                              padding: const EdgeInsets.only(
                                                  left: 10,
                                                  top: 16,
                                                  bottom: 16),
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
                                              weeksList: Workout1Model
                                                      .workoutListItems()[index]
                                                  .weeks,
                                              isBlue: Workout1Model
                                                      .workoutListItems()[index]
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
                                                  left: 10,
                                                  top: 16,
                                                  bottom: 16),
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
                                              weeksList: Workout1Model
                                                      .workoutListItems()[index]
                                                  .weeks,
                                              isBlue: Workout1Model
                                                      .workoutListItems()[index]
                                                  .isProcessing,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                );
              },
            )));
  }
}
