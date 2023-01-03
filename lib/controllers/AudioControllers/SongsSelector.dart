import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class SongsSelector extends StatelessWidget {
  final Playing? playing;
  final List<Audio> audios;
  final Function(Audio) onSelected;
  final Function(List<Audio>) onPlaylistSelected;

  SongsSelector(
      {required this.playing,
      required this.audios,
      required this.onSelected,
      required this.onPlaylistSelected});

  Widget _image(Audio item) {
    if (item.metas.image == null) {
      return SizedBox(height: 40, width: 40);
    }

    return item.metas.image?.type == ImageType.network
        ? Image.network(
            item.metas.image!.path,
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          )
        : Image.asset(
            item.metas.image!.path,
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // FractionallySizedBox(
          //   widthFactor: 1,
          //   child: RaisedButton(
          //     onPressed: () {
          //       onPlaylistSelected(audios);
          //     },
          //     child: Center(child: Text('All as playlist')),
          //   ),
          // ),
          Text(
            'Queue',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
              // decoration: TextDecoration.underline,
              // decorationThickness: 2.0
            ),
            textAlign: TextAlign.start
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.0, left: 8.0, right: 8.0),
            child: Divider(
              color: Colors.black45,
              thickness: 1.25,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, position) {
                final item = audios[position];
                final isPlaying = item.path == playing?.audio.assetAudioPath;
                return Container(
                  child: ListTile(
                      leading: Material(
                        shape: CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        child: _image(item),
                      ),
                      title: Text(item.metas.title.toString(),
                          style: TextStyle(
                            color: isPlaying ? Colors.blue : Colors.black,
                          )),
                      onTap: () {
                        onSelected(item);
                      }),
                );
              },
              itemCount: audios.length,
            ),
          ),
        ],
      ),
    );
  }
}
