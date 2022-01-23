import 'dart:async';

import 'package:flutter/material.dart';

class TimerDemo2 extends StatefulWidget {
  @override
  _TimerDemo2State createState() => _TimerDemo2State();
}

class _TimerDemo2State extends State<TimerDemo2> {
  Timer _timer;
  int _start = 0;
  bool _vibrationActive = false;

  void startTimer(int timerDuration) {
    if (_timer != null) {
      _timer.cancel();
    }
    setState(() {
      _start = timerDuration;
    });
    const oneSec = const Duration(seconds: 1);
    print('test');
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            print('alarm');
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  void pauseTimer() {
    if (_timer != null) _timer.cancel();
  }

  void unpauseTimer() => startTimer(_start);

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Countdown'),
        ),
        body: Wrap(children: <Widget>[
          Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  startTimer(10);
                },
                child: Text("start"),
              ),
              Text("$_start"),
              RaisedButton(
                onPressed: () {
                  pauseTimer();
                },
                child: Text("pause"),
              ),
              RaisedButton(
                onPressed: () {
                  unpauseTimer();
                },
                child: Text("unpause"),
              ),
            ],
          ),
        ]));
  }
}
