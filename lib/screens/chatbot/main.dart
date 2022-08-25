import 'package:flutter/material.dart';
import 'chat.dart';

void main() {
  runApp(MaterialApp(
    home: Chatbot(),
  ));
}

class Chatbot extends StatelessWidget {
  const Chatbot({key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sound Player'),
        ),
        body: Container(
          color: Color(0xFFFAFAFA),
          child: Center(child: Chat()),
        ),
      ),
    );
  }
}