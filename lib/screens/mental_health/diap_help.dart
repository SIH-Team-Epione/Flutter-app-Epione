import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Diap_Help extends StatefulWidget {
  const Diap_Help({
    Key? key,
  }) : super(key: key);
  String get urlVid => "https://www.youtube.com/watch?v=gAkjx25o4eI";

  String geturlVideo(){
    return urlVid;
  }

  @override
  State<Diap_Help> createState() => _Diap_HelpState();
}


class _Diap_HelpState extends State<Diap_Help> {

  late YoutubePlayerController controller;

  @override
  void initState(){
    super.initState();
    final paretoUrl = widget.urlVid;

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(paretoUrl)!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,

      ),
    );

  }
  Widget build(BuildContext context) => YoutubePlayerBuilder(

      player: YoutubePlayer(
        controller: controller,
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          title:const Text("How it works"),
        ),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 0.0,bottom: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 20),
                    child: Text(
                      "Diaphragmatic breathing is a breathing exercise that helps strengthen your diaphragm, an important muscle that enables you to breathe. Diaphragmatic breathing has many benefits that affect your entire body. It is the basis for almost all meditation or relaxation techniques, which can lower your stress levels, reduce your blood pressure, and regulate other critical bodily processes.",
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                  Container(
                    // padding: const EdgeInsets.all(30.0),
                    padding: const EdgeInsets.all(30.0),

                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

                        const SizedBox(height: 10.0),
                        Text("How it works:",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0
                          ),),

                        //   widget.urlImg,
                        //   width: MediaQuery.of(context).size.width,
                        // ),
                        const SizedBox(height: 20.0),
                        player,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
  );
}
