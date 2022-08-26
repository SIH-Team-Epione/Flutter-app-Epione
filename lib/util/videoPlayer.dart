import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PmrVdPlayer extends StatefulWidget {
  final String path;
  const PmrVdPlayer({Key? key, required this.path}) : super(key: key);

  @override
  State<PmrVdPlayer> createState() => PmrVdPlayerState();
}

class PmrVdPlayerState extends State<PmrVdPlayer> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    final vdPath = widget.path;

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.path)!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        "Video Player"
      )
    ),
    body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: controller,
          ),
          builder: (context, player) => Scaffold(
            body: Container(
              padding: const EdgeInsets.all(0.0),
              margin: EdgeInsets.symmetric(horizontal: 5,vertical: 200),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  player,
                  Divider(
                    height: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
  );
}
