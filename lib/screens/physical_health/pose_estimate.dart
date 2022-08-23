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
  double acc=0.0;
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
                            Future.delayed(const Duration(milliseconds: 3000), () {
                              acc = double.parse(accuracy);
                            });
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
                  height: 140,
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
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: new LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width - 50,
                          animation: true,
                          lineHeight: 34.0,
                          percent: acc/100.0,
                          center: Text(accuracy+"%", style: TextStyle(fontWeight: FontWeight.w700,
                          fontSize: 20),),
                          barRadius: const Radius.circular(16),
                          progressColor: Colors.teal,
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}

