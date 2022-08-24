import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AudioPlayerAsset extends StatefulWidget {
  final String path;
  const AudioPlayerAsset({required this.path, Key? key}) : super(key: key);

  @override
  State<AudioPlayerAsset> createState() => AudioPlayerAssetState();
}

class AudioPlayerAssetState extends State<AudioPlayerAsset> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    setupPlaylist();
  }

  setupPlaylist() async {
    // await audioPlayer.open(Audio(this.widget.path), autoStart: false);

    try {
      await audioPlayer.open(
        Audio.network(this.widget.path),
      );
    } catch (t) {
      //mp3 unreachable
    }
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  Widget circularAudioPalyer(
      RealtimePlayingInfos realtimePlayingInfos, double screenwidth) {
    Color primaryColor = Colors.amber;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 80),
        CircularPercentIndicator(
          radius: screenwidth / 4,
          arcType: ArcType.HALF,
          progressColor: Colors.white,
          percent: realtimePlayingInfos.currentPosition.inSeconds /
              realtimePlayingInfos.duration.inSeconds,
          center: IconButton(
            iconSize: screenwidth / 8,
            color: Colors.black,
            icon: Icon(
              realtimePlayingInfos.isPlaying
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
            ),
            onPressed: () {
              audioPlayer.playOrPause();
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/img7.jpg'), fit: BoxFit.cover),
        ),
        alignment: Alignment.center,
        child: audioPlayer.builderRealtimePlayingInfos(
            builder: (context, realtimePlayingInfos) {
          if (realtimePlayingInfos != null) {
            return circularAudioPalyer(
                realtimePlayingInfos, MediaQuery.of(context).size.width);
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
