import 'package:fitness_app/selection_page.dart';
import 'file:///D:/AndroidStudioProjects/fitness_app/lib/demos/timeline_demo2.dart';
import 'package:fitness_app/video_items.dart';
import 'package:fitness_app/workout_timeline.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FullBodyWorkout extends StatefulWidget {
  @override
  _FullBodyWorkoutState createState() => _FullBodyWorkoutState();
}

class _FullBodyWorkoutState extends State<FullBodyWorkout> {
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

  String videoURL = "https://www.youtube.com/watch?v=5JmWguyvu7Y&t=3s";
  YoutubePlayerController _controller;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL),
      flags: YoutubePlayerFlags(autoPlay: false),
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: 200.0,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: isShrink
                    ? Text("FULL BODY",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                        ))
                    : Text("FULL BODY",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                background: Image.asset(
                  "images/image1.jpg",
                  fit: BoxFit.cover,
                )),
            leading: IconButton(
              color: isShrink ? Colors.black : Colors.white,
              icon: Icon(Icons.menu),
              onPressed: () {
                print("This is icon button");
              },
              iconSize: 30,
            ),
            elevation: 0.0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("images/gift.png"),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: _controller,
                            aspectRatio: 16 / 9,
                            showVideoProgressIndicator: true,
                            thumbnail: Image(
                              image: NetworkImage(
                                  "https://i.ytimg.com/an_webp/5JmWguyvu7Y/mqdefault_6s.webp?du=3000&sqp=CJSy2IEG&rs=AOn4CLCOYhtoZm8S2KXj0dst5Gu2bD9CfA"),
                            ),
                          ),
                          builder: (context, player) {
                            return Column(
                              children: <Widget>[player],
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "This video will help you learn the full body workout and the form that you should maintain while performing the workout",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              wordSpacing: 8,
                              fontSize: 20,
                              foreground: new Paint()..shader = linearGradient,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 55.0,
                          color: Colors.white,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return WorkoutTimelinePage();
                              }));
                            },
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
                                  "SET A PLAN",
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
              ),
            ]),
          )
        ],
      ),
    );
  }
}
