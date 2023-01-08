import 'package:flutter/material.dart';

class JoinScreen extends StatelessWidget {
  final void Function() onCreateMeetingButtonPressed;
  final void Function() onJoinMeetingButtonPressed;
  final void Function(String) onMeetingIdChanged;

  const JoinScreen({
    Key? key,
    required this.onCreateMeetingButtonPressed,
    required this.onJoinMeetingButtonPressed,
    required this.onMeetingIdChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/VideoCall.webp'),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 3,
                  color: Color(0xffd0d0d0),
                  offset: Offset(3, 3),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Divider(
            height: 1,
            thickness: 2,
            color: Colors.teal[400],
          ),
          SizedBox(
            height: 24,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "Create a new video room",
                style: TextStyle(fontSize: 16),
              ),
              onPressed: onCreateMeetingButtonPressed),
          const SizedBox(height: 16),
          Text(
            "OR",
            style: TextStyle(
                color: Colors.teal[400],
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          // const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
            child: Text(
              "Join an existing room",
              style: TextStyle(fontSize: 16),
            ),
          ),
          TextField(
              decoration: const InputDecoration(
                hintText: "Room ID",
                border: OutlineInputBorder(),
              ),
              onChanged: onMeetingIdChanged),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "Join",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            onPressed: onJoinMeetingButtonPressed,
          )
        ],
      ),
    );
  }
}
