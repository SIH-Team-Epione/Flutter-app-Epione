import 'package:flutter/material.dart';

class MeetingControls extends StatelessWidget {
  final void Function() onToggleMicButtonPressed;
  final void Function() onToggleCameraButtonPressed;
  final void Function() onLeaveButtonPressed;
  bool isCameraOn;
  bool isMicOn;

  MeetingControls({
    Key? key,
    required this.onToggleMicButtonPressed,
    required this.onToggleCameraButtonPressed,
    required this.onLeaveButtonPressed,
    required this.isCameraOn,
    required this.isMicOn
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            onLeaveButtonPressed;
          },
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red.shade400,
                  ),
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.call_end, size: 30, color: Colors.white,),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            onToggleCameraButtonPressed;
            isCameraOn = !isCameraOn;
          },
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.teal.shade400,
                  ),
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.video_call, size: 30, color: Colors.white,),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            onToggleMicButtonPressed;
            isMicOn = !isMicOn;
          },
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.teal.shade400,
                  ),
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.mic, size: 30, color: Colors.white,),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}