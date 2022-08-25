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

  Widget build(BuildContext context) => YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
        ),
        builder: (context, player) => Scaffold(
          body: Container(
            padding: const EdgeInsets.all(10.0),
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
      );
}
