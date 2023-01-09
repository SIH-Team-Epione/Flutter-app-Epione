import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../../util/network_image.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quiz_app/models/further_social_list.dart';

import 'further_read_page.dart';
import 'further_read_social_page.dart';

class MoreSocialHealth extends StatefulWidget {
  const MoreSocialHealth({Key? key}) : super(key: key);

  @override
  State<MoreSocialHealth> createState() => _MoreSocialHealthState();
}

class _MoreSocialHealthState extends State<MoreSocialHealth> {
  @override
  Widget build(BuildContext context) {
    int columnCount = 2;
    print(articlesList[0].id.toString() + articlesList[0].urlImage);

    return Scaffold(
      appBar: AppBar(
        title: Text('Further Reading'),
        backgroundColor: Colors.black,
      ),
      body: AnimationLimiter(
        child: GridView.count(
          crossAxisCount: columnCount,
          children: List.generate(
            4,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 375),
                columnCount: columnCount,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: Card(
                        color: Colors.transparent,
                        margin: EdgeInsets.all(15),
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image:
                                      AssetImage(articlesList[index].urlImage),
                                  fit: BoxFit.cover)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(
                                        articlesList[index].urlImage),
                                    fit: BoxFit.cover)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      stops: [
                                        .1,
                                        .9
                                      ],
                                      colors: [
                                        Colors.black.withOpacity(.5),
                                        Colors.black.withOpacity(.1),
                                      ])),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Colors.transparent,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FurtherReadSocialScreen(
                                                  index: index)));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0,
                                          right: 30,
                                          top: 20,
                                          bottom: 30),
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: <Widget>[
                                          Text(
                                            articlesList[index].title,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
