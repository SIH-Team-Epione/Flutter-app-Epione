import 'package:flutter/material.dart';

class DietsScreen extends StatefulWidget {
  const DietsScreen({Key? key}) : super(key: key);

  @override
  State<DietsScreen> createState() => _DietsScreenState();
}

class _DietsScreenState extends State<DietsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diets'),
      ),
    );
  }
}



