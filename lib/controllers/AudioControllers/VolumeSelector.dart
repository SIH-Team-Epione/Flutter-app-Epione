import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class VolumeSelector extends StatelessWidget {
  final double volume;
  final Function(double) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Volume ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Slider(
              min: AssetsAudioPlayer.minVolume,
              max: AssetsAudioPlayer.maxVolume,
              value: volume,
              thumbColor: Colors.grey[400],
              activeColor: Colors.grey[300],
              inactiveColor: Colors.grey[200],
              onChanged: (value) {
                onChange(value);
              },
            ),
          )
        ],
      ),
    );
  }

  const VolumeSelector({
    required this.volume,
    required this.onChange,
  });
}
