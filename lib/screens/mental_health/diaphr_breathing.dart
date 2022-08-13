import 'package:flutter/material.dart';

class DiaphragmScreen extends StatefulWidget {
  const DiaphragmScreen({Key? key}) : super(key: key);

  @override
  State<DiaphragmScreen> createState() => _DiaphragmScreenState();
}

class _DiaphragmScreenState extends State<DiaphragmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diaphragmatic breathing'),
      ),
    );
  }
}