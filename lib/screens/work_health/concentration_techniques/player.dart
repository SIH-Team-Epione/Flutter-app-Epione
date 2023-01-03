import 'dart:async';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import '../../../controllers/AudioControllers/PlayingControls.dart';
import '../../../controllers/AudioControllers/PositionSeekWidget.dart';
import '../../../controllers/AudioControllers/SongsSelector.dart';
import '/models/Sounds.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  late AssetsAudioPlayer _assetsAudioPlayer;
  final List<StreamSubscription> _subscriptions = [];
  final audios = sounds;

  @override
  void initState() {
    AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
      return true;
    });

    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();

    _subscriptions.add(_assetsAudioPlayer.playlistAudioFinished.listen((data) {
      print('playlistAudioFinished : $data');
    }));
    _subscriptions.add(_assetsAudioPlayer.audioSessionId.listen((sessionId) {
      print('audioSessionId : $sessionId');
    }));

    openPlayer();
  }

  void openPlayer() async {
    await _assetsAudioPlayer.open(
      Playlist(audios: audios, startIndex: 0),
      showNotification: true,
      autoStart: true,
    );
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    print('dispose');
    super.dispose();
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus and Relax'),
      ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  //   child: Text(
                  //     'Focus and Relax',
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.w600,
                  //       fontFamily: 'Montserrat',
                  //       fontSize: 20.0,
                  //     ),
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Stack(
                    fit: StackFit.passthrough,
                    children: <Widget>[
                      StreamBuilder<Playing?>(
                          stream: _assetsAudioPlayer.current,
                          builder: (context, playing) {
                            if (playing.data != null) {
                              final myAudio = find(
                                  audios, playing.data!.audio.assetAudioPath);
                              print(playing.data!.audio.assetAudioPath);
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                                child: myAudio.metas.image?.path == null
                                    ? const SizedBox()
                                    : myAudio.metas.image?.type ==
                                    ImageType.network
                                    ? ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                        myAudio.metas.image!.path,
                                        width: double.infinity,
                                        height: MediaQuery.of(context).size.width * 0.85,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                    : ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.asset(
                                        myAudio.metas.image!.path,
                                        width: double.infinity,
                                        height: MediaQuery.of(context).size.width * 0.85,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                              );
                            }
                            return SizedBox.shrink();
                          }),
                      // Align(
                      //   alignment: Alignment.topRight,
                      //   child: RaisedButton(
                      //     padding: EdgeInsets.all(18),
                      //     // margin: EdgeInsets.all(18),
                      //     onPressed: () {
                      //       // AssetsAudioPlayer.playAndForget(
                      //       //     Audio('assets/audios/horn.mp3'));
                      //     },
                      //     child: Icon(
                      //       Icons.add_alert,
                      //       color: Colors.grey[800],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  StreamBuilder<Playing?>(
                    stream: _assetsAudioPlayer.current,
                    builder: (context, playing) {
                      if (playing.data != null) {
                        final myAudio = find(
                            audios, playing.data!.audio.assetAudioPath);
                        return Column(
                          children: [
                            Text(
                              '${myAudio.metas.title}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                  fontSize: 24.0),
                            ),
                            SizedBox(height: 8.0,),
                            Text(
                              '${myAudio.metas.artist}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat',
                                  fontSize: 16.0),
                            ),
                            SizedBox(height: 5.0),
                          ],
                        );
                      };
                      return SizedBox.shrink();
                    }),
                  _assetsAudioPlayer.builderCurrent(
                      builder: (context, Playing? playing) {
                        return Column(
                          children: <Widget>[
                            _assetsAudioPlayer.builderRealtimePlayingInfos(
                                builder: (context, RealtimePlayingInfos? infos) {
                                  if (infos == null) {
                                    return SizedBox();
                                  }
                                  //print('infos: $infos');
                                  return PositionSeekWidget(
                                    currentPosition: infos.currentPosition,
                                    duration: infos.duration,
                                    seekTo: (to) {
                                      _assetsAudioPlayer.seek(to);
                                    },
                                  );
                                }),
                            _assetsAudioPlayer.builderLoopMode(
                              builder: (context, loopMode) {
                                return PlayerBuilder.isPlaying(
                                    player: _assetsAudioPlayer,
                                    builder: (context, isPlaying) {
                                      return PlayingControls(
                                        loopMode: loopMode,
                                        isPlaying: isPlaying,
                                        isPlaylist: true,
                                        onStop: () {
                                          _assetsAudioPlayer.stop();
                                          dispose();
                                        },
                                        toggleLoop: () {
                                          _assetsAudioPlayer.toggleLoop();
                                        },
                                        onPlay: () {
                                          _assetsAudioPlayer.playOrPause();
                                        },
                                        onNext: () {
                                          //_assetsAudioPlayer.forward(Duration(seconds: 10));
                                          _assetsAudioPlayer.next(
                                              keepLoopMode:
                                              true /*keepLoopMode: false*/);
                                        },
                                        onPrevious: () {
                                          _assetsAudioPlayer.previous(
                                            /*keepLoopMode: false*/);
                                        },
                                      );
                                    });
                              },
                            ),

                          ],
                        );
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  _assetsAudioPlayer.builderCurrent(
                      builder: (BuildContext context, Playing? playing) {
                        return SongsSelector(
                          audios: audios,
                          onPlaylistSelected: (myAudios) {
                            _assetsAudioPlayer.open(
                              Playlist(audios: myAudios),
                              showNotification: true,
                              headPhoneStrategy:
                              HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
                              audioFocusStrategy: AudioFocusStrategy.request(
                                  resumeAfterInterruption: true),
                            );
                          },
                          onSelected: (myAudio) async {
                            try {
                              await _assetsAudioPlayer.open(
                                myAudio,
                                autoStart: true,
                                showNotification: true,
                                playInBackground: PlayInBackground.enabled,
                                audioFocusStrategy: AudioFocusStrategy.request(
                                    resumeAfterInterruption: true,
                                    resumeOthersPlayersAfterDone: true),
                                headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplug,
                                notificationSettings: NotificationSettings(
                                  //seekBarEnabled: false,
                                  //stopEnabled: true,
                                  //customStopAction: (player){
                                  //  player.stop();
                                  //}
                                  //prevEnabled: false,
                                  //customNextAction: (player) {
                                  //  print('next');
                                  //}
                                  //customStopIcon: AndroidResDrawable(name: 'ic_stop_custom'),
                                  //customPauseIcon: AndroidResDrawable(name:'ic_pause_custom'),
                                  //customPlayIcon: AndroidResDrawable(name:'ic_play_custom'),
                                ),
                              );
                            } catch (e) {
                              print(e);
                            }
                          },
                          playing: playing,
                        );
                      }),
                  /*
                  PlayerBuilder.volume(
                      player: _assetsAudioPlayer,
                      builder: (context, volume) {
                        return VolumeSelector(
                          volume: volume,
                          onChange: (v) {
                            _assetsAudioPlayer.setVolume(v);
                          },
                        );
                      }),
                   */
                  /*
                  PlayerBuilder.forwardRewindSpeed(
                      player: _assetsAudioPlayer,
                      builder: (context, speed) {
                        return ForwardRewindSelector(
                          speed: speed,
                          onChange: (v) {
                            _assetsAudioPlayer.forwardOrRewind(v);
                          },
                        );
                      }),
                   */
                  /*
                  PlayerBuilder.playSpeed(
                      player: _assetsAudioPlayer,
                      builder: (context, playSpeed) {
                        return PlaySpeedSelector(
                          playSpeed: playSpeed,
                          onChange: (v) {
                            _assetsAudioPlayer.setPlaySpeed(v);
                          },
                        );
                      }),
                   */
                ],
              ),
            ),
          ),
        ),
      );
  }
}