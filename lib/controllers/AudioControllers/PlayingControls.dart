import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import '/screens/work_health/concentration_home.dart';

class PlayingControls extends StatelessWidget {
  final bool isPlaying;
  final LoopMode? loopMode;
  final bool isPlaylist;
  final Function()? onPrevious;
  final Function() onPlay;
  final Function()? onNext;
  final Function()? toggleLoop;
  final Function()? onStop;

  PlayingControls({
    required this.isPlaying,
    this.isPlaylist = false,
    this.loopMode,
    this.toggleLoop,
    this.onPrevious,
    required this.onPlay,
    this.onNext,
    this.onStop,
  });

  Widget _loopIcon(BuildContext context) {
    final iconSize = 20.0;
    if (loopMode == LoopMode.none) {
      return  Icon(
          Icons.loop_rounded,
          size: iconSize,
          color: Colors.grey,
        );
        // iconSize: 20.0,

    } else if (loopMode == LoopMode.playlist) {
      return Icon(
          Icons.loop_rounded,
          size: iconSize,
          color: Colors.white,
        );

        // iconSize: 20.0,
    } else {
      //single
      return Stack(
        alignment: Alignment.center,
        children: [
          Icon(
              Icons.loop_rounded,
              size: iconSize,
              color: Colors.white,
            ),
          Center(
            child: Text(
              '1',
              style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  color: Colors.white
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        // GestureDetector(
        //   onTap: () {
        //     if (toggleLoop != null) toggleLoop!();
        //   },
          CircleAvatar(
            radius: 20.0,
            child: IconButton(
                icon: _loopIcon(context),
                onPressed: () {
                  if (toggleLoop != null) toggleLoop!();
                },
                color: Colors.teal[400],
            ),
          ),

        SizedBox(
          width: 12,
        ),
        CircleAvatar(
          radius: 25.0,
          child: IconButton(
            color: Colors.teal[400],
            // padding: EdgeInsets.all(18),
            onPressed: isPlaylist ? onPrevious : null,
            icon: Icon(
                Icons.skip_previous_rounded,
                color: Colors.white,
            ),
            iconSize: 30.0,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        CircleAvatar(
          radius: 35.0,
          child: IconButton(
            // padding: EdgeInsets.all(5),
            color: Colors.teal[400],
            onPressed: onPlay,
            icon: Icon(
              isPlaying
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
              // size: 32,
              color: Colors.white,
            ),
            iconSize: 35.0,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        CircleAvatar(
          radius: 25.0,
          child: IconButton(
            // padding: EdgeInsets.all(18),
            color: Colors.teal[400],
            onPressed: isPlaylist ? onNext : null,
            icon: Icon(
                Icons.skip_next_rounded,
                color: Colors.white,
            ),
            iconSize: 30.0,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        if (onStop != null)
          CircleAvatar(
            radius: 20.0,
            child: IconButton(
              // padding: EdgeInsets.all(16),
              icon: Icon(
                Icons.stop_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                onStop;
                // Navigator.push(context,
                //   MaterialPageRoute(
                //       builder: (context) => ConcentrationHomeScreen()),
                Navigator.pop(context);
              },
              iconSize: 20.0,
            ),
          ),
      ],
    );
  }
}
