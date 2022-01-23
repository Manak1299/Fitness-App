import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

const kTileHeight = 200.0;

class Timeline2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<_TimelineStatus> data = [
      _TimelineStatus.done,
      _TimelineStatus.inProgress,
      _TimelineStatus.inProgress,
      _TimelineStatus.todo
    ];
    return Container(
      color: Colors.white,
      child: Flexible(
        child: Timeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: Color(0xffc2c5c9),
            connectorTheme: ConnectorThemeData(
              thickness: 3.0,
            ),
          ),
          padding: EdgeInsets.only(top: 20.0),
          builder: TimelineTileBuilder.connected(
            indicatorBuilder: (context, index) {
              return DotIndicator(
                color: data[index].isInProgress ? null : Color(0xff193fcc),
                child: Icon(
                  Icons.bolt,
                  size: 30,
                ),
              );
            },
            connectorBuilder: (_, index, connectorType) {
              var color;
              if (index == 0) {
                color = data[0].isInProgress && data[0].isInProgress
                    ? Color(0xff193fcc)
                    : null;
              }
              return SolidLineConnector(
                indent: connectorType == ConnectorType.start ? 0 : 2.0,
                endIndent: connectorType == ConnectorType.end ? 0 : 2.0,
                color: color,
              );
            },
            contentsBuilder: (_, index) => _EmptyContents(
              position: index,
            ),
            itemExtentBuilder: (_, __) {
              return kTileHeight;
            },
            itemCount: data.length,
          ),
        ),
      ),
    );
  }
}

class _EmptyContents extends StatelessWidget {
  final int position;

  _EmptyContents({this.position});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Week ${position}",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}

enum _TimelineStatus {
  done,
  sync,
  inProgress,
  todo,
}

extension on _TimelineStatus {
  bool get isInProgress => this == _TimelineStatus.inProgress;
}
