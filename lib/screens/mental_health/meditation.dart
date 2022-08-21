import 'package:flutter/material.dart';
import 'package:quiz_app/util/app_colors.dart' as AppColors;
import 'package:quiz_app/util/data.dart' as Data;
import 'package:quiz_app/util/audio_file.dart';
import 'package:quiz_app/util/mytabs.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Guide to meditation",
          style: TextStyle(
            fontSize: 30,
            color: Color(0xFF000000),
          ),
        ),
        iconTheme: IconThemeData(color: Color(0xFF000000)),
        backgroundColor: Color(0xFFfafafa),
      ),
      body: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 180,
                child: PageView.builder(
                    controller: PageController(viewportFraction: 0.9),
                    itemCount: Data.imgQuote == null ? 0 : Data.imgQuote.length,
                    itemBuilder: (_, i) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                Data.quotes[i],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 10, 10, 10),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(Data.imgQuote[i]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (BuildContext context, bool isScroll) {
                    return [
                      SliverAppBar(
                        pinned: true,
                        backgroundColor: AppColors.sliverBackground,
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(50),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20, left: 10),
                            child: TabBar(
                              indicatorPadding: const EdgeInsets.all(0),
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding: const EdgeInsets.only(right: 10),
                              controller: _tabController,
                              isScrollable: true,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 7,
                                        offset: Offset(0, 0))
                                  ]),
                              tabs: [
                                MyTabs(
                                    color: AppColors.menu1Color,
                                    text: "6-13 yrs"),
                                MyTabs(
                                    color: AppColors.menu2Color,
                                    text: "14-18 yrs"),
                                MyTabs(
                                    color: AppColors.menu3Color,
                                    text: "19-30 yrs")
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
                          itemCount: Data.imagetabBarView1.length,
                          itemBuilder: (_, i) {
                            return Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.tabVarViewColor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      offset: Offset(0, 0),
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 120,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                Data.imagetabBarView1[i]),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AudioPlayerAsset(
                                                      path: Data
                                                          .tabBarView1Audio[i]),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          Data.tabBarView1Title[i],
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Avenir",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                      ListView.builder(
                          itemCount: Data.imagetabBarView2.length,
                          itemBuilder: (_, i) {
                            return Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.tabVarViewColor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      offset: Offset(0, 0),
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 120,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                Data.imagetabBarView2[i]),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AudioPlayerAsset(
                                                      path: Data
                                                          .tabBarView2Audio[i]),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          Data.tabBarView2Title[i],
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Avenir",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                      ListView.builder(
                          itemCount: Data.imagetabBarView3.length,
                          itemBuilder: (_, i) {
                            return Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.tabVarViewColor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      offset: Offset(0, 0),
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 120,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                Data.imagetabBarView3[i]),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AudioPlayerAsset(
                                                      path: Data
                                                          .tabBarView3Audio[i]),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          Data.tabBarView3Title[i],
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Avenir",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
