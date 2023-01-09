import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:quiz_app/models/time_tech_list.dart';

class TimeTechScreen extends StatefulWidget {
  const TimeTechScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;
  String get urlImg => techsList[id].urlImage;
  String get urlVid => techsList[id].urlVideo;
  String get title => techsList[id].title;
  String get desc => techsList[id].description;
  String get howto => techsList[id].howto;

  String geturlVideo(){
    return urlVid;
  }

  @override
  State<TimeTechScreen> createState() => _TimeTechScreenState();
}


class _TimeTechScreenState extends State<TimeTechScreen> {

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
        body: Stack(
          children: <Widget>[
            Container(
                child: Image.asset(widget.urlImg, fit: BoxFit.cover)),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16.0,bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 265),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16.0),
                    child: Text(
                      widget.title,
                      style: TextStyle(color: Colors.black, fontSize: 28.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(32.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(widget.desc,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.0
                          ),),
                        const SizedBox(height: 10.0),
                        Text("How it works:",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0
                          ),),
                        const SizedBox(height: 10.0),
                        Text(
                          widget.howto,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.0
                          ),),
                        const SizedBox(height: 10.0),
                        //Image.asset(
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
