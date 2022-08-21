import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyTabs extends StatelessWidget {
  final Color color;
  final String text;
  const MyTabs({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 120,
      height: 50,
      child: Text(
        this.text,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 7,
            offset: Offset(0, 0),
          ),
        ],
      ),
    );
  }
}
