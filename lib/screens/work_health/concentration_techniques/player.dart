import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';
import '/controllers/playerControls.dart';
import '/models/Audio.dart';
import '/models/Sounds.dart';

class MusicPlayer extends StatefulWidget {

  @override
  _MusicPlayer createState() => _MusicPlayer();
}

class _MusicPlayer extends State<MusicPlayer> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sound Player'),
        ),
      body: ChangeNotifierProvider(
        create: (_) => Audio(),
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                child: Text(
                  'Focus and Relax',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Consumer<Audio>(
                    builder: (_, myAudioModel, child) => Image.network(
                      //'assets/images/ocean.jpg',
                      //'https://www.99images.com/download-image/869224/2880x2560',
                      '${sounds[myAudioModel.index]['imageUrl']}',
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.85,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18.0),
              Consumer<Audio>(
                builder: (_, myAudioModel, child) => Text(
                  '${sounds[myAudioModel.index]['title']}',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                      fontSize: 24.0
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Consumer<Audio>(
                builder: (_, myAudioModel, child) => Text(
                  '${sounds[myAudioModel.index]['artist']}',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat',
                      fontSize: 16.0
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Consumer<Audio>(
                builder: (_, myAudioModel, child) => Slider(
                    min: 0,
                    max: myAudioModel.duration.inSeconds.toDouble(),
                    value: myAudioModel.position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await myAudioModel.audioPlayer.seek(position);

                      // Play audio if audio was paused
                      await myAudioModel.audioPlayer.resume();
                    }
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Consumer<Audio>(
                  builder: (_, myAudioModel, child) =>
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formatTime(myAudioModel.position)),
                          Text(formatTime(myAudioModel.duration)),     // (duration - position)
                        ],
                      ),
                ),
              ),
              SizedBox(height: 5.0),
              PlayerControls(),
            ],
          ),
        ),
      ),
    );
  }

  playAudio() {
    audioPlayer.resume();
  }

  pauseAudio() {
    audioPlayer.pause();
  }

// setNextIndex() {
//   setState(() {
//     index = (index + 1) % 3;
//   });
// }
//
// setPrevIndex() {
//   setState(() {
//     if (index == 0) {
//       index = 2;
//     }
//     else {
//       index = (index - 1);
//     }
//   });
// }
}