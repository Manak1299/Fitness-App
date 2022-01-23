import 'package:fitness_app/models/fullbody_workout_model.dart';
import 'package:fitness_app/workoutStartPage.dart';
import 'package:flutter/material.dart';

import 'adjustpage.dart';

class WorkoutsPage extends StatefulWidget {
  List<String> item = [
    "Pushups",
    "Pullups", /*
    "Squats",
    "Lunges",
    "Employee",
    "Manager",
    "Worker",
    "Owner"*/
  ];
  final String day;
  WorkoutsPage({this.day});
  @override
  _WorkoutsPageState createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  List<FullBodyWorkoutModel> fullbodyworkoutList = List<FullBodyWorkoutModel>();

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
    fullbodyworkoutList = FullBodyWorkoutModel.fullbodyWorkoutListItems();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*  return Scaffold(
      appBar: AppBar(
        title: Text(
          "DAY ${widget.day}",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
        ),
      ),
      body: Text("test"),
    );*/
    return Scaffold(
      body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.white,
                expandedHeight: 150.0,
                leading: isShrink
                    ? BackButton(
                        color: Colors.black,
                      )
                    : BackButton(
                        color: Colors.white,
                      ),
                flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.all(10.0),
                    title: isShrink
                        ? Padding(
                            padding:
                                const EdgeInsets.only(left: 40.0, bottom: 5),
                            child: Text(
                              "DAY ${widget.day}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 22),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "DAY ${widget.day}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "FULL BODY",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    background: Image.asset(
                      "images/image1.jpg",
                      fit: BoxFit.cover,
                    )),
              )
            ];
          },
          body: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  height: 50.0,
                  margin: const EdgeInsets.only(
                      bottom: 6.0), //Same as `blurRadius` i guess
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 4,
                        height: 20,
                        color: Color(0xFF004DFE),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "16 mins",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.circle,
                        size: 10,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "15 workouts",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReorderableListView(
                  children: <Widget>[
                    for (final items in fullbodyworkoutList)
                      Card(
                        color: Colors.white,
                        key: ValueKey(items),
                        elevation: 1,
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Icon(
                                  Icons.menu,
                                  size: 30,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Image.network(
                                "https://fitpass-images.s3.amazonaws.com/content_blog_inner_E4B1CDF6.gif",
                                scale: 4,
                              ),
                              Container(
                                height: 100,
                                width: 150,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        items.workoutName,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        items.workoutReps,
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                  onReorder: (int oldIndex, int newIndex) {
                    setState(() {
                      if (newIndex > oldIndex) {
                        newIndex -= 1;
                      }
                      final items = fullbodyworkoutList.removeAt(oldIndex);
                      fullbodyworkoutList.insert(newIndex, items);
                    });
                  },
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      print("test");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AdjustPage();
                      }));
                    },
                    child: Image(
                      image: AssetImage(
                        "images/adjust2.png",
                      ),
                      height: 100,
                    ),
                  ),
                  Container(
                    width: 300,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return WorkoutStartPage();
                        }));
                      },
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
                            "START",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

/*
children: <Widget>[
for (final items
in FullBodyWorkoutModel.fullbodyWorkoutListItems())
Card(
color: Colors.white,
key: ValueKey(items),
elevation: 1,
child: Container(
child: Row(
children: [
Padding(
padding: const EdgeInsets.only(left: 10.0),
child: Icon(
Icons.menu,
size: 30,
color: Colors.grey[400],
),
),
Image.network(
"https://fitpass-images.s3.amazonaws.com/content_blog_inner_E4B1CDF6.gif",
scale: 4,
),
Container(
height: 100,
width: 150,
child: Column(
mainAxisAlignment:
MainAxisAlignment.spaceAround,
children: [
Flexible(
child: Text(
items.workoutName,
style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.w900),
),
),
Align(
alignment: Alignment.bottomLeft,
child: Text(
items.workoutReps,
style: TextStyle(
fontSize: 24,
color: Colors.grey,
fontWeight: FontWeight.w500),
),
),
],
),
),
],
),
),
),
],
onReorder: (int oldIndex, int newIndex) {
setState(() {
if (newIndex > oldIndex) {
newIndex -= 1;
}
final items =
FullBodyWorkoutModel.fullbodyWorkoutListItems()
    .removeAt(oldIndex);
FullBodyWorkoutModel.fullbodyWorkoutListItems()
    .insert(newIndex, items);
});
},
),
),*/
