// ignore_for_file: deprecated_member_use

import 'PSQI3.dart';
import 'result.dart';
import 'package:flutter/material.dart';

class Psqi2 extends StatefulWidget {
  const Psqi2({Key? key, required this.qnaList}) : super(key: key);
  final qnaList;

  @override
  State<Psqi2> createState() => _Psqi2State();
}

class _Psqi2State extends State<Psqi2> {
  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  final Map<String, num> qna2 = {
    "A. Cannot get to sleep wihtin 30 minutes": 0,
    "B. Wake up in the middle of the night or early morning ": 0,
    "C. Have to get up to use the bathroom": 0,
    "D. Cannot breathe comfortably": 0,
    "E. Cough or snore loudly": 0,
    "F. Feel too cold": 0,
    "G. Feel too hot": 0,
    "H. Have bad dreams": 0,
    "I. Have pain": 0,
    "How often have you taken medicine to help you sleep ": 0,
    "How often have you had trouble staying awake while driving, eating meals, or engaging in social activities":
        0,
    "How much of a problem has it been for you to keep up enthusiasm to get things done":
        0,
  };
  List<num> Convert(Map<String, num> qna) {
    List<num> valuesList = qna2.values.toList();
    return valuesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 244, 247),
      appBar: AppBar(
        title: Text(
          'Pittsburgh Sleep Quality Index',
          style: TextStyle(color: Colors.white70),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  decoration: BoxDecoration(
                    color: Colors.teal[200],
                    //border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 155, 155, 155),
                        offset: Offset(5.0, 5.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'In the past month,\n',
                        style: TextStyle(
                          color: Colors.teal[100],
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'How often have you had trouble sleeping because you-',
                        style: TextStyle(
                          color: Colors.teal[100],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '0) Not during past month',
                        style: TextStyle(
                          color: Colors.teal[100],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '1) Less than once a week',
                        style: TextStyle(
                          color: Colors.teal[100],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //2)Once or Twice a week\n3)Three or more times a week\n
                      Text(
                        '2)Once or Twice a week',
                        style: TextStyle(
                          color: Colors.teal[100],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '3)Three or more times a week',
                        style: TextStyle(
                          color: Colors.teal[100],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            for (var q in qna2.keys) question(q),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                foregroundColor: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'NEXT',
                  style: TextStyle(color: Colors.black38, fontSize: 10),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  List qnaList2 = Convert(qna2);
                  return Psqi3(qnaList: widget.qnaList, qnaList2: qnaList2);
                }));
              },
            ),
          ],
        ), //Padding
      ),
    );
  }

  Widget question(String question) {
    final myController = TextEditingController();
    return Container(
      padding: const EdgeInsets.only(top: 15),
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Stack(
        children: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.5, color: Colors.white60),
                borderRadius: BorderRadius.circular(
                  20,
                )),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, left: 10),
                    child: Text(
                      question,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextField(
                    onChanged: ((value) {
                      print(value);
                    }),
                    onSubmitted: ((value) {
                      print(value);
                      setState(() {
                        qna2[question] = num.parse(value);
                        ;
                      });
                    }),
                    controller: myController,
                    decoration: InputDecoration(
                      // filled: true,
                      hintText: 'Enter only numeric value',

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 128, 124, 124),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 207, 199, 199),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
