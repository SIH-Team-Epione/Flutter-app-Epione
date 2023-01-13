import 'package:flutter/material.dart';
import 'package:videosdk/videosdk.dart';
import 'participant_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MeetingScreen extends StatefulWidget {
  final String meetingId;
  final String token;
  final void Function() leaveMeeting;

  const MeetingScreen(
      {Key? key,
      required this.meetingId,
      required this.token,
      required this.leaveMeeting})
      : super(key: key);

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  Map<String, Stream?> participantVideoStreams = {};

  bool micEnabled = true;
  bool camEnabled = true;
  bool isScreenShared = false;
  // late List<MediaDeviceInfo> cameras;
  late Room room;
  // late Participant part;

  void setParticipantStreamEvents(Participant participant) {
    participant.on(Events.streamEnabled, (Stream stream) {
      if (stream.kind == 'video') {
        setState(() {
          participantVideoStreams[participant.id] = stream;
          // part.id = participant.id;
        });
      }
    });

    participant.on(Events.streamDisabled, (Stream stream) {
      if (stream.kind == 'video') {
        setState(() {
          participantVideoStreams.remove(participant.id);
        });
      }
    });
  }

  void setMeetingEventListener(Room _room) {
    setParticipantStreamEvents(_room.localParticipant);
    _room.on(
      Events.participantJoined,
      (Participant participant) => setParticipantStreamEvents(participant),
    );
    _room.on(Events.participantLeft, (String participantId) {
      if (participantVideoStreams.containsKey(participantId)) {
        setState(() => participantVideoStreams.remove(participantId));
      }
    });
    _room.on(Events.roomLeft, () {
      participantVideoStreams.clear();
      widget.leaveMeeting();
    });
  }

  @override
  void initState() {
    super.initState();
    // Create instance of Room (Meeting)
    final user = FirebaseAuth.instance.currentUser;
    room = VideoSDK.createRoom(
      roomId: widget.meetingId,
      token: widget.token,
      displayName: user!.displayName!,
      micEnabled: micEnabled,
      camEnabled: camEnabled,
      maxResolution: 'hd',
      defaultCameraIndex: 1,
      notification: NotificationInfo(
        title: user.displayName!,
        message: "${user.displayName} is sharing screen in the meeting",
        icon: "notification_share", // drawable icon name
      ),
    );

    // cameras = room.getCameras();

    setMeetingEventListener(room);

    // Join meeting
    room.join();
  }

  Widget _viewRows() {
    return Column(
      children: [
        ...participantVideoStreams.values
            .map(
              (e) => ParticipantTile(
                stream: e!,
                height: MediaQuery.of(context).size.height *
                        0.90 /
                        participantVideoStreams.length -
                    4.1,
              ),
            )
            .toList(),
        // List.generate(participantVideoStreams.length, (index) =>
        //   Expanded(
        //     child: ParticipantTile(
        //       stream: participantVideoStreams.values.toList()[index]!,
        //     ),
        //   )
        // ),
      ],
    );
  }

  Widget _roomId() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Center(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 18, color: Color(0xffe0e0e0)),
              children: [
                TextSpan(
                  text: "Room ID: ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                    text: room.id,
                    style: TextStyle(fontStyle: FontStyle.italic)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _toolbar() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.red,
            ),
            child: IconButton(
              color: Color(0xfff0f0f0),
              onPressed: () {
                room.end();
                Navigator.pop(context);
              },
              icon: Icon(Icons.call_end),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.teal,
            ),
            child: IconButton(
              color: Color(0xfff0f0f0),
              onPressed: () {
                micEnabled ? room.muteMic() : room.unmuteMic();
                setState(() => micEnabled = !micEnabled);
              },
              icon: micEnabled
                  ? Icon(Icons.mic_off_rounded)
                  : Icon(Icons.mic_rounded),
            ),
          ),
          Container(
            width: 50,
            // height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.teal,
            ),
            child: IconButton(
              color: Color(0xfff0f0f0),
              onPressed: () {
                camEnabled ? room.disableCam() : room.enableCam();
                setState(() => camEnabled = !camEnabled);
              },
              icon: camEnabled
                  ? Icon(Icons.videocam_off_rounded)
                  : Icon(Icons.videocam_rounded),
            ),
          ),
          // Container(
          //   width: 50,
          //   height: 50,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(50),
          //     color: Colors.teal,
          //   ),
          //   child: IconButton(
          //     color: Color(0xfff0f0f0),
          //     onPressed: () {
          //       if (!isScreenShared) 
          //         room.enableScreenShare();
          //       else
          //         room.disableScreenShare();
          //       setState(() => isScreenShared = !isScreenShared);
          //     },
          //     icon: isScreenShared ? Icon(Icons.stop_screen_share) : Icon(Icons.screen_share_rounded),
          //   ),
          // ),
          // Container(
          //   width: 50,
          //   height: 50,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(50),
          //     color: Colors.teal,
          //   ),
          //   child: IconButton(
          //     color: Color(0xfff0f0f0),
          //     onPressed: () {
          //       room.changeCam(room.localParticipant.id);
          //     },
          //     icon: Icon(Icons.switch_camera_rounded),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text(
          'Video Call',
          style: TextStyle(color: Colors.white70),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            _viewRows(),
            _roomId(),
            _toolbar(),
          ],
        ),
      ),
    );
  }
}
