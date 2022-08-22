import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';
import 'package:teachable/teachable.dart';

class PoseEstimatorPage extends StatefulWidget {
  PoseEstimatorPage({Key? key, required this.posename}) : super(key: key);

  final String posename;

  @override
  _PoseEstimatorPageState createState() => _PoseEstimatorPageState();
}

class _PoseEstimatorPageState extends State<PoseEstimatorPage> {
  String accuracy = "";
  @override
  Widget build(BuildContext context) {

    print("\n\nwidget build called\n\n");
    return Scaffold(
        appBar: AppBar(title: Text(widget.posename), centerTitle: false,),
        body: Stack(
          children: [
            Container(
                child: Column(children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Teachable(
                        path: "pose/index.html",
                        results: (res) {
                          var resp = jsonDecode(res);
                          // print("The values are ${}");
                          setState(() {
                            accuracy = (resp[widget.posename] * 100.0).toStringAsFixed(2);
                          });
                        },
                      ),
                    ),
                  ),
                ])),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.posename+" Accuracy: ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.all(10.0),
                      //   child: new LinearPercentIndicator(
                      //     width: MediaQuery.of(context).size.width - 50,
                      //     animation: true,
                      //     lineHeight: 20.0,
                      //     percent: (double.parse(accuracy)/100.0),
                      //     center: Text(accuracy),
                      //     linearStrokeCap: LinearStrokeCap.roundAll,
                      //     progressColor: Colors.teal,
                      //   ),
                      // ),
                    ],
                  )),
            )
          ],
        ));
  }
}

