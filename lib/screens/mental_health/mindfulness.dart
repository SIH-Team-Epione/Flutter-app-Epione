import 'package:flutter/material.dart';

class MindfulnessScreen extends StatefulWidget {
  const MindfulnessScreen({Key? key}) : super(key: key);

  @override
  State<MindfulnessScreen> createState() => _MindfulnessScreenState();
}

class _MindfulnessScreenState extends State<MindfulnessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mindfulness'),
      ),
    );
  }
}


