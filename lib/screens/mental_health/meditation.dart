import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/util/data.dart' as Data;
import 'package:quiz_app/util/audio_file.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  State<MeditationScreen> createState() => MeditationScreenState();
}

class MeditationScreenState extends State<MeditationScreen>
    with SingleTickerProviderStateMixin {
  late YoutubePlayerController ytcontroller;
  late ScrollController _scrollController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final vdPath = "https://www.youtube.com/watch?v=fZrJPUU9fTE&t=25s";
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();

    ytcontroller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(vdPath)!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Meditation"),
        ),
        body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: ytcontroller,
          ),
          builder: (context, player) => Scaffold(
            backgroundColor: Colors.teal.shade50,
            body: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Correct Posture for Meditation',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.teal.shade50,
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: player,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: NestedScrollView(
                      controller: _scrollController,
                      headerSliverBuilder:
                          (BuildContext context, bool isScroll) {
                        return [
                          SliverAppBar(
                            automaticallyImplyLeading: false,
                            pinned: true,
                            backgroundColor: Colors.teal.shade50,
                            bottom: PreferredSize(
                              preferredSize: Size.fromHeight(10),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  bottom: 20,
                                ),
                                child: TabBar(
                                  indicatorPadding: const EdgeInsets.all(0),
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelPadding:
                                      const EdgeInsets.only(right: 10),
                                  controller: _tabController,
                                  isScrollable: true,
                                  tabs: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 30, right: 30),
                                      child: Text(
                                        "6-13 yrs",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 30, right: 30),
                                      child: Text(
                                        "14-18 yrs",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 30, right: 30),
                                      child: Text(
                                        "19-30 yrs",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ];
                      },
                      body: TabBarView(
                        controller: _tabController,
                        children: [
                          ListView.builder(
                            itemCount: Data.imagetabBarView2.length,
                            itemBuilder: (_, i) {
                              return InkWell(
                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    padding: EdgeInsets.all(15),
                                    // color: Colors.white,
                                    child: Row(
                                      children: [
                                        Container(
                                          child: CircleAvatar(
                                            child: Icon(
                                              FontAwesomeIcons.headphones,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Flexible(
                                          child: Text(Data.tabBarView1Title[i]),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade50,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 10,
                                          // spreadRadius: 3,
                                        ),
                                      ],
                                    )),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AudioPlayerAsset(
                                        path: Data.tabBarView1Audio[i],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: Data.imagetabBarView2.length,
                            itemBuilder: (_, i) {
                              return InkWell(
                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    padding: EdgeInsets.all(15),
                                    // color: Colors.white,
                                    child: Row(
                                      children: [
                                        Container(
                                          child: CircleAvatar(
                                            child: Icon(
                                              FontAwesomeIcons.headphones,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Flexible(
                                          child: Text(Data.tabBarView2Title[i]),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade50,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 10,
                                          // spreadRadius: 3,
                                        ),
                                      ],
                                    )),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AudioPlayerAsset(
                                        path: Data.tabBarView2Audio[i],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: Data.imagetabBarView2.length,
                            itemBuilder: (_, i) {
                              return InkWell(
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  padding: EdgeInsets.all(15),
                                  // color: Colors.white,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: CircleAvatar(
                                          child: Icon(
                                            FontAwesomeIcons.headphones,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        child: Text(Data.tabBarView3Title[i]),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade200,
                                        blurRadius: 10,
                                        // spreadRadius: 3,
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AudioPlayerAsset(
                                        path: Data.tabBarView3Audio[i],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
