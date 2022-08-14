import 'package:flutter/material.dart';

class PMRScreen extends StatefulWidget {
  const PMRScreen({Key? key}) : super(key: key);

  @override
  State<PMRScreen> createState() => _PMRScreenState();
}

class _PMRScreenState extends State<PMRScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progressive Muscle Relaxation'),
      ),
    );
  }
}


