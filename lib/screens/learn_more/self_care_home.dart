import 'package:flutter/material.dart';

class LearnMoreSelfCare extends StatefulWidget {
  const LearnMoreSelfCare({Key? key}) : super(key: key);

  @override
  State<LearnMoreSelfCare> createState() => _LearnMoreSelfCareState();
}

class _LearnMoreSelfCareState extends State<LearnMoreSelfCare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn More about Mental Health'),
      ),
    );
  }
}
