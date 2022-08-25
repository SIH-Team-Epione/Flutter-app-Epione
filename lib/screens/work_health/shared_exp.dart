import 'package:flutter/material.dart';

class SharedExperiencesScreen extends StatefulWidget {
  const SharedExperiencesScreen({Key? key}) : super(key: key);

  @override
  State<SharedExperiencesScreen> createState() => _SharedExperiencesScreenState();
}

class _SharedExperiencesScreenState extends State<SharedExperiencesScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Shared Experiences'),
          centerTitle: false,
        ),
      ),
    );
  }
}
