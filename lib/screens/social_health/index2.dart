import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'api.dart';
import 'join_screen.dart';
import 'meeting_screen.dart';

class VideoCall extends StatefulWidget {
  const VideoCall({Key? key}) : super(key: key);

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  String meetingId = "";
  bool isMeetingActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Video Call',
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: JoinScreen(
                  onMeetingIdChanged: (value) => meetingId = value,
                  onCreateMeetingButtonPressed: () async {
                    meetingId = await createMeeting();
                    await _handleCameraAndMic(Permission.camera);
                    await _handleCameraAndMic(Permission.microphone);
                    setState(() => isMeetingActive = true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MeetingScreen(
                          meetingId: meetingId,
                          token: token,
                          leaveMeeting: () => setState(() => isMeetingActive = false),
                        ),
                      ),
                    );
                  },
                  onJoinMeetingButtonPressed: () {
                    setState(() => isMeetingActive = true);
                  },
                ),
        ),
      ),
    );
  }
  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status.toString());
  }
}
