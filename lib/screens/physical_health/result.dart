import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'PSQI.dart';
import 'PSQI2.dart';
import 'PSQI3.dart';

class Result extends StatefulWidget {
  final qnaList, qnaList2, qnaList3;
  Result(
      {Key? key,
        required this.qnaList,
        required this.qnaList2,
        required this.qnaList3})
      : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  num sum = 0;
  // var KeyList=qna.values.toList();
  // var KeyList=qna2.values.toList();
  // var KeyList=qna3.values.toList();

  void Cal() {
    num c1, c2, c3, c4, c5, c6, c7;
    c1 = widget.qnaList3[0];
    '$c1';
    num v2 = widget.qnaList[2];
    if (v2 < 15)
      c2 = 0;
    else if (v2 < 30)
      c2 = 1;
    else if (v2 < 60) {
      c2 = 2;
    } else
      c2 = 3;
    num v5a = widget.qnaList2[0];
    c2 = c2 + v5a;
    if (c2 == 0)
      c2 = 0;
    else if (c2 > 1 && c2 < 2)
      c2 = 1;
    else if (c2 > 3 && c2 < 4)
      c2 = 2;
    else if (c2 > 5 && c2 < 6) c2 = 3;
    c3 = widget.qnaList[3];
    if (c3 > 7)
      c3 = 0;
    else if (c3 > 6)
      c3 = 1;
    else if (c3 > 5)
      c3 = 2;
    else
      c3 = 3;
    num v4a = widget.qnaList[5];
    num v4b = widget.qnaList[6];
    v4a = v4a * 100;
    c4 = (v4a / v4b);
    if (c4 > 85)
      c4 = 0;
    else if (c4 > 75)
      c4 = 1;
    else if (c4 > 65)
      c4 = 2;
    else
      c4 = 3;
    num v5b = widget.qnaList2[1];
    num v5c = widget.qnaList2[2];
    num v5d = widget.qnaList2[3];
    num v5e = widget.qnaList2[4];
    num v5f = widget.qnaList2[5];
    num v5g = widget.qnaList2[6];
    num v5h = widget.qnaList2[7];
    num v5i = widget.qnaList2[8];
    c5 = v5a + v5c + v5d + v5e + v5f + v5g + v5h + v5i;
    if (c5 == 0)
      c5 = 0;
    else if (c5 < 9)
      c5 = 1;
    else if (c5 < 18)
      c5 = 2;
    else if (c5 < 27) c5 = 3;
    c6 = widget.qnaList2[9];
    c7 = widget.qnaList2[10] + widget.qnaList2[11];
    sum = c1 + c2 + c3 + c4 + c5 + c6 + c7;
    return;
  }

  @override
  Widget build(BuildContext context) {
    Cal();
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
                      'This questionnaire assessed different aspects of your sleep, as well as some features of your daytime functioning. The following result is used to get an idea about the quantity and quality of your sleep.\n',
                      style: TextStyle(
                        color: Colors.teal[100],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 195, 197, 211),
                        offset: Offset(0.0, 5.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.document_scanner),
                      SizedBox(width: 10),
                      Text('Your PSQI Score is $sum'),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Card(

                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 0.5, color: Colors.white60),
                          borderRadius: BorderRadius.circular(
                            20,
                          )),
                      child: Container(

                        //margin: EdgeInsets.all(10),
                        child: Column(

                          children: [
                            Image(
                              image: AssetImage('assets/images/psqi.jpg'),

                            ),
                            Container(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.teal[200],
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                                ),

                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'A total score of "5" or greater is indicative of poor sleep quality. If you scored "5" or more it is suggested that you discuss your sleep habits with a healthcare provider\n',
                                    style: TextStyle(
                                      color: Colors.grey[50],
                                      fontSize: 14.0,
                                    ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
