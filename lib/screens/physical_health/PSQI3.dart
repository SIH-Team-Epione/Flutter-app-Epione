// ignore_for_file: deprecated_member_use

import 'result.dart';
import 'package:flutter/material.dart';

class Psqi3 extends StatefulWidget {
  const Psqi3({Key? key, required this.qnaList, required this.qnaList2})
      : super(key: key);
  final qnaList, qnaList2;

  @override
  State<Psqi3> createState() => _Psqi3State();
}

class _Psqi3State extends State<Psqi3> {
  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  final Map<String, num> qna3 = {
    "How would you rate your sleep quality overall": 0,
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
                        '0) Very Good  1) Fairly Good  2)Once or Twice a week',
                        style: TextStyle(
                          color: Colors.teal[100],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '3)Fairly Bad  4)Very Bad',
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
            for (var q in qna3.keys) question(q),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                foregroundColor: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'SUBMIT',
                  style: TextStyle(color: Colors.black38, fontSize: 10),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  List qnaList3 = Convert(qna3);
                  return Result(
                      qnaList: widget.qnaList,
                      qnaList2: widget.qnaList2,
                      qnaList3: qnaList3);
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
                        qna3[question] = num.parse(value);
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
