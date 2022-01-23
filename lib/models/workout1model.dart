import 'package:fitness_app/models/week_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Workout1Model {
  List<WeekModel> weeks = List<WeekModel>();
  int workout_weeks = 0;
  final bool isCompleted;
  final bool isProcessing;

  Workout1Model(
      this.weeks, this.workout_weeks, this.isCompleted, this.isProcessing);

  static List<Workout1Model> workoutListItems() {
    List<Workout1Model> workoutlist = List<Workout1Model>();
    workoutlist.add(Workout1Model(WeekModel.weekListItems(), 1, true, false));
    workoutlist.add(Workout1Model(WeekModel.weekListItems2(), 2, false, true));
    workoutlist.add(Workout1Model(WeekModel.weekListItems3(), 3, false, false));
    workoutlist.add(Workout1Model(WeekModel.weekListItems4(), 4, false, false));

    return workoutlist;
  }
}
