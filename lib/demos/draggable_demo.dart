import 'package:fitness_app/models/fullbody_workout_model.dart';
import 'package:flutter/material.dart';

class DraggableTest extends StatefulWidget {
  @override
  _DraggableTestState createState() => _DraggableTestState();
}

class _DraggableTestState extends State<DraggableTest> {
  List<FullBodyWorkoutModel> fullbodyworkoutList = List<FullBodyWorkoutModel>();
  @override
  void initState() {
    super.initState();
    fullbodyworkoutList = FullBodyWorkoutModel.fullbodyWorkoutListItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ReorderableListView(
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Text(
                              items.workoutName,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
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
          print("@@@oldIndex ==$oldIndex");
          print("@@@oldIndex ==$newIndex");
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final items = fullbodyworkoutList.removeAt(oldIndex);
            fullbodyworkoutList.insert(newIndex, items);
          });
        },
      ),
    );
  }
}
