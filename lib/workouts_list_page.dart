import 'package:flutter/material.dart';

class WorkoutsPageDEMo extends StatefulWidget {
  List<String> item = [
    "Pushups", /*
    "Pullups",
    "Squats",
    "Lunges",
    "Employee",
    "Manager",
    "Worker",
    "Owner"*/
  ];
  @override
  _WorkoutsPageState createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPageDEMo> {
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
                            height: 500,
                            child: ReorderableListView(
                              children: <Widget>[
                                for (final items in widget.item)
                                  Card(
                                    color: Colors.white,
                                    key: ValueKey(items),
                                    elevation: 2,
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Image.network(
                                            "https://fitpass-images.s3.amazonaws.com/content_blog_inner_E4B1CDF6.gif",
                                            scale: 2,
                                          ),
                                        ),
                                        Text(
                                          "JUMPING JACKS",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                              ],
                              onReorder: reorderData,
                            ),
                          )
                        ]),
                      )
                    ],
                  ),
                );
              },
            )));
  }
}
