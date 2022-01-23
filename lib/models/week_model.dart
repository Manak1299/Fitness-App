import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeekModel {
  final int daysOfWeek;
  final bool isCompleted;
  final bool isProcessing;
  final Color color;
  final String imagePath;

  WeekModel(this.daysOfWeek, this.isCompleted, this.isProcessing, this.color,
      this.imagePath);

  static List<WeekModel> weekListItems() {
    List<WeekModel> weekList = List<WeekModel>();
    weekList.add(WeekModel(1, true, true, Color(0xFF0054FE), ""));
    weekList.add(WeekModel(2, true, true, Color(0xFF0054FE), ""));
    weekList.add(WeekModel(3, true, true, Color(0xFF0054FE), ""));
    weekList.add(WeekModel(4, true, true, Color(0xFF0054FE), ""));
    weekList.add(WeekModel(5, true, true, Color(0xFF0054FE), ""));
    weekList.add(WeekModel(6, true, true, Color(0xFF0054FE), ""));
    weekList.add(WeekModel(7, true, true, Color(0xFF0054FE), ""));
    weekList
        .add(WeekModel(8, true, true, Color(0xFF0054FE), "images/sel1.jpg"));
    return weekList;
  }

  static List<WeekModel> weekListItems2() {
    List<WeekModel> weekList = List<WeekModel>();
    weekList.add(WeekModel(1, false, true, Color(0xFF0054FE), ""));
    weekList.add(WeekModel(2, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(3, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(4, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(5, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(6, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(7, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(
        WeekModel(8, true, true, Color(0xFF0054FE), "images/week2-bw.jpg"));
    return weekList;
  }

  static List<WeekModel> weekListItems3() {
    List<WeekModel> weekList = List<WeekModel>();
    weekList.add(WeekModel(1, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(2, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(3, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(4, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(5, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(6, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(7, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(
        WeekModel(8, true, true, Color(0xFF0054FE), "images/week3-bw.jpg"));
    return weekList;
  }

  static List<WeekModel> weekListItems4() {
    List<WeekModel> weekList = List<WeekModel>();
    weekList.add(WeekModel(1, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(2, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(3, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(4, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(5, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(6, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(WeekModel(7, false, false, Color(0xFFC4C5CA), ""));
    weekList.add(
        WeekModel(8, true, true, Color(0xFF0054FE), "images/week4-bw.jpg"));
    return weekList;
  }
}
