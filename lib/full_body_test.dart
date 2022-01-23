import 'package:fitness_app/video_items.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FullBodyWorkout2 extends StatefulWidget {
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
  @override
  _FullBodyWorkoutState createState() => _FullBodyWorkoutState();
}

class _FullBodyWorkoutState extends State<FullBodyWorkout2> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              pinned: true,
              floating: false,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("FULL BODY",
                      style: TextStyle(
                        color: isShrink ? Colors.black : Colors.white,
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
          )
        ];
      },
      body: Expanded(
        child: ReorderableListView(
          children: <Widget>[
            for (final items in widget.item)
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
                                items,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "x10",
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
          onReorder: reorderData,
        ),
      ),
    ));
  }
}
/*
 Container(
                            height: 100,
                            child: Center(
                              child: ListTile(
                                leading: Image.network(
                                  "https://fitpass-images.s3.amazonaws.com/content_blog_inner_E4B1CDF6.gif",
                                  height: 100,
                                ),
                                title: Text("Jumping Jacks"),
                                trailing: Icon(
                                  Icons.menu,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),


  SliverAppBar(
            pinned: true,
            floating: false,
            backgroundColor: Colors.white,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("FULL BODY",
                    style: TextStyle(
                      color: isShrink ? Colors.black : Colors.white,
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
                    ],
                  ),
                ),
              ),
              Container(
                height: 400,
                child: ReorderableListView(
                  children: <Widget>[
                    for (final items in widget.item)
                      Card(
                        color: Colors.blueGrey,
                        key: ValueKey(items),
                        elevation: 2,
                        child: ListTile(
                          title: Text(items),
                          leading: Icon(
                            Icons.work,
                            color: Colors.black,
                          ),
                        ),
                      ),
                  ],
                  onReorder: reorderData,
                ),
              )
            ]),
          )











import 'package:fitness_app/video_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FullBodyWorkout extends StatefulWidget {
  List<String> item = [
    "Pushups",
    "Pullups",
    "Squats",
    "Lunges",
  ];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: _controller,
                    aspectRatio: 16 / 9,
                    showVideoProgressIndicator: true,
                  ),
                  builder: (context, player) {
                    return Column(
                      children: <Widget>[player],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ReorderableListView(
            children: <Widget>[
              for (final items in widget.item)
                Card(
                  color: Colors.white,
                  key: ValueKey(items),
                  elevation: 2,
                  child: ListTile(
                    title: Text(items),
                    leading: Icon(
                      Icons.work,
                      color: Colors.black,
                    ),
                  ),
                ),
            ],
            onReorder: reorderData,
          ),
        )
      ],
    ));
  }
}
*/
