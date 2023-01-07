// ignore_for_file: deprecated_member_use

import 'PSQI2.dart';
import 'package:flutter/material.dart';

class Psqi extends StatefulWidget {
  const Psqi({Key? key}) : super(key: key);

  @override
  State<Psqi> createState() => _PsqiState();
}

// class qna {
//   String question;
//   int answer;
//   qna({required this.question, required this.answer});
// }

class _PsqiState extends State<Psqi> {
  final fieldText = TextEditingController();
  void clearText() {
    fieldText.clear();
  }

  final Map<String, num> qna = {
    "When have you usually gone to bed (hr[0-23])": 0,
    "When have you usually gone to bed (min[0-59])": 0,
    "How long (in minutes) has it taken you to fall asleep each night": 0,
    "What time have you usually gotten up in morning(hr[0-23]) ": 0,
    "What time have you usually gotten up in morning(min[0-59]) ": 0,
    "How many hours of actual sleep did you get at night": 0,
    "How many hours were you in bed": 0,
  };
  List<num> Convert(Map<String, num> qna) {
    List<num> valuesList = qna.values.toList();
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
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  decoration: BoxDecoration(
                    color: Colors.teal[200],
                    // border: Border.symmetric(color: Colors.black),
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
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'In the past month...\n',
                      style: TextStyle(
                        color: Colors.teal[100],
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            for (var q in qna.keys) question(q),
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
                  List qnaList = Convert(qna);
                  return Psqi2(qnaList: qnaList);
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
            child: Container(
              padding: const EdgeInsets.all(20.0),
              //margin: EdgeInsets.all(10),
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
                        qna[question] = num.parse(value);
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
