import 'package:flutter/material.dart';

class LearnMoreMentalScreen extends StatefulWidget {
  const LearnMoreMentalScreen({Key? key}) : super(key: key);

  @override
  State<LearnMoreMentalScreen> createState() => _LearnMoreMentalScreenState();
}

class _LearnMoreMentalScreenState extends State<LearnMoreMentalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn More about Mental Health'),
      ),
    );
  }
}
