import 'package:flutter/material.dart';

class LearnMorePhysicalScreen extends StatefulWidget {
  const LearnMorePhysicalScreen({Key? key}) : super(key: key);

  @override
  State<LearnMorePhysicalScreen> createState() => _LearnMorePhysicalScreenState();
}

class _LearnMorePhysicalScreenState extends State<LearnMorePhysicalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn More about Mental Health'),
      ),
    );
  }
}
