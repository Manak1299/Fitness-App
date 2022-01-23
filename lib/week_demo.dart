import 'dart:math';

import 'package:fitness_app/models/week_model.dart';
import 'package:fitness_app/workout_page.dart';
import 'package:flutter/material.dart';

class WeekPage extends StatefulWidget {
  List<WeekModel> weekModelList = List<WeekModel>();

  WeekPage(List<WeekModel> weeksList) {
    this.weekModelList = weeksList;
  }

  @override
  _WeekPageState createState() => _WeekPageState();
}

class _WeekPageState extends State<WeekPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 90 / 70,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                widget.weekModelList.length,
                (index) {
                  if (!widget.weekModelList[index].isProcessing &&
                      !widget.weekModelList[index].isCompleted) {
                    if (index == 7) {
                      return Image.asset(
                        widget.weekModelList[index].imagePath,
                        fit: BoxFit.cover,
                      );
                    } else {
                      return Row(
                        children: [
                          Container(
                            width: 50,
                            height: 60,
                            child: Center(
                                child: Text(
                              widget.weekModelList[index].daysOfWeek.toString(),
                              style: TextStyle(
                                  fontSize: 30, color: Color(0xFFC4C5CA)),
                            )),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xFFC4C5CA),
                                  width: 3,
                                )),
                          ),
                          Expanded(
                            child: Icon(Icons.arrow_forward_ios_rounded,
                                color: Color(0xFFC4C5CA)),
                          ),
                        ],
                      );
                    }
                  } else if (widget.weekModelList[index].isCompleted) {
                    if (index == 7) {
                      return Image.asset(
                        widget.weekModelList[index].imagePath,
                        fit: BoxFit.cover,
                      );
                    } else {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("hiii----${[index]}");
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return WorkoutsPage(
                                  day: (index + 1).toString(),
                                );
                              }));
                            },
                            child: Container(
                              width: 50,
                              height: 60,
                              child: Center(
                                  child: Icon(
                                Icons.check,
                                color: Colors.white,
                              )),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF0054FE),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Icon(Icons.arrow_forward_ios_rounded,
                                color: Color(0xFF0054FE)),
                          )
                        ],
                      );
                    }
                  } else if (widget.weekModelList[index].isProcessing) {
                    if (index == 7) {
                      return Image.asset(
                        widget.weekModelList[index].imagePath,
                        fit: BoxFit.cover,
                      );
                    } else {
                      return Row(
                        children: [
                          CircularBorder(
                            width: 3,
                            size: 50,
                            color: Color(0xFF0054FE),
                            icon: Text(
                                WeekModel.weekListItems()[index]
                                    .daysOfWeek
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 30, color: Color(0xFF0054FE))),
                          ),
                          Expanded(
                            child: Icon(Icons.arrow_forward_ios_rounded,
                                color: Color(0xFFC4C5CA)),
                          )
                        ],
                      );
                    }
                  } else {
                    if (index == 7) {
                      return Image.asset(
                        widget.weekModelList[index].imagePath,
                        fit: BoxFit.cover,
                      );
                    } else {
                      return Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            child: Center(
                                child: Text(
                              WeekModel.weekListItems()[index]
                                  .daysOfWeek
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 30, color: Color(0xFFC4C5CA)),
                            )),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xFFC4C5CA),
                                  width: 3,
                                )),
                          ),
                          Expanded(
                            child: Icon(Icons.arrow_forward_ios_rounded,
                                color: Color(0xFFC4C5CA)),
                          )
                        ],
                      );
                    }
                  }
                },
              ),
            ),
          )),
    );
  }
}

class CircularBorder extends StatelessWidget {
  final Color color;
  final double size;
  final double width;
  final Widget icon;

  const CircularBorder(
      {Key key,
      this.color = Colors.blue,
      this.size = 70,
      this.width = 7.0,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          icon == null ? Container() : icon,
          CustomPaint(
            size: Size(size, size),
            foregroundPainter:
                new MyPainter(completeColor: color, width: width),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  Color lineColor = Colors.transparent;
  Color completeColor;
  double width;

  MyPainter({this.completeColor, this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    var percent = (size.width * 0.001) / 2;

    double arcAngle = 2 * pi * percent;
    print("$radius - radius");
    print("$arcAngle - arcAngle");
    print("${radius / arcAngle} - divider");

    for (var i = 0; i < 8; i++) {
      var init = (-pi / 2) * (i / 2);

      canvas.drawArc(new Rect.fromCircle(center: center, radius: radius), init,
          arcAngle, false, complete);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
