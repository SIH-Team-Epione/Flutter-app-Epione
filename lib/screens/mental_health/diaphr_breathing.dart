import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'diap_help.dart';

import '../color_pomo/colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class DiaphragmScreen extends StatefulWidget {
  const DiaphragmScreen({Key? key}) : super(key: key);

  @override
  State<DiaphragmScreen> createState() => _DiaphragmScreenState();
}
int a=0;
double z=4;
bool _isVisible = true;
String text='Breathe For 4 Second';
class _DiaphragmScreenState extends State<DiaphragmScreen> {
  double defaultValue = 4;
  double value = 4.0;
  bool isStarted = false;
  int focusedMins = 0;

  // List<History> listHistory = [];

  late Timer _timer;

  // HistoryController historyController = HistoryController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: green1));
    // HistoryController.init();
  }

  void startTimer() {
    focusedMins = value.toInt();
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (value < 1) {
          setState(() {
            a=a+1;
            if(a==1){
              text='Hold breathe for 6 second';

              isStarted = true;
              z=6;
              value = 6;
            }
            else if(a==2){
              // Future.delayed(const Duration(seconds: 5));
              text='Breathe Out For 8 Second';
              isStarted = true;
              z=8;
              value=8;
            }
            else{
              timer.cancel();
              isStarted = false;
            }
            print(a);
          });
        }
        

        
        else {
          setState(() {
            value--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green2,
      appBar: AppBar(
        title:const Text("Diaphragmatic Breathing"),
      ),
      body: Column(
        children: [
        Visibility(
        visible: _isVisible,
        child: Dismissible(
          key: Key('tips'),
          child: Container(
            color: Color(0xFFF6D6D7),
            child: Row(
              children: <Widget> [
                Expanded(
                  flex: 2,
                  // padding: const EdgeInsets.fromLTRB(5.0, 2.0, 0.0, 2.0),
                  child: Icon(
                    Icons.lightbulb,
                    color: Color(0xFFFEBD40),
                    size: 28.0,
                  ),
                ),
                Expanded(
                  flex: 10,
                  // padding: const EdgeInsets.fromLTRB(8.0, 2.0, 220.0, 2.0),
                  child: RichText(
                    text: TextSpan(
                        text: 'If you want see how to perform this exercise then click here',
                        // text: 'Tips to increase concentration',
                        // children: [
                        //   Container(padding: EdgeInsets.only(bottom: 5.0)),
                        // ],
                        style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            decorationThickness: 1.0
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => Diap_Help()),
                            );
                            print('I was clicked');
                          }
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = false;
                      });
                    },
                    icon: Icon(Icons.close_rounded),
                    color: Color(0xFF293241),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      child:Text(
                              // 'Breath In For 4 Second',
                              text,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                              ),

                            ),
                            margin: new EdgeInsets.symmetric(vertical: 40.0),
                    ),

                    Center(
                      child: SizedBox(
                        width: 250,
                        child: Stack(
                          children: [

                            SleekCircularSlider(
                              initialValue: value,
                              // initialValue: 0,
                              min: 0,
                              // max: 5401,
                              max: z,
                              appearance: CircularSliderAppearance(
                                animDurationMultiplier: 0.0001,
                                customWidths: CustomSliderWidths(
                                  trackWidth: 15,
                                  handlerSize: 20,
                                  progressBarWidth: 15,
                                  shadowWidth: 0,
                                ),
                                customColors: CustomSliderColors(
                                  trackColor: Colors.tealAccent.shade100,
                                  progressBarColor: Colors.tealAccent.shade700,
                                  hideShadow: true,
                                  dotColor: Colors.tealAccent.shade700,
                                ),
                                size: 250,
                                angleRange: 180,
                                // angleRange: 360,
                                // startAngle: 270,
                                startAngle:180,

                              ),
                              onChange: (newValue) {
                                setState(() {
                                  value = newValue;
                                });
                              },
                              innerWidget: (double newValue) {
                                return Center(
                                  child: Text(
                                    // "${(value ~/ 60).toInt().toString().padLeft(2, '0')}:${(value % 60).toInt().toString().padLeft(2, '0')}",
                                    "${(value % 60).toInt().toString().padLeft(1, '0')}",

                                    style: TextStyle(
                                      color: color4,
                                      fontSize: 96,
                                    ),
                                  ),
                                );
                              },
                            ),
                            if (isStarted)
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 250,
                                  height: 250,
                                  color: Colors.transparent,
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (!isStarted) {
                            isStarted = true;

                            if(a>2){
                              a=0;
                              z=4;
                              text="Breathe For 4 Second";
                              value=4;
                            }
                            startTimer();
                          } else {
                            _timer.cancel();
                            value = value;
                            isStarted = false;
                          }
                        });
                      },
                      child: Container(
                        width: 200,
                        height: 50,

                        decoration: BoxDecoration(
                          color: green1,

                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: const Offset(0, 3),
                              color: Colors.black.withOpacity(0.1),
                            )
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          // isStarted ? "STOP" : "START",
                          isStarted ? "STOP": "START",


                          style: TextStyle(
                            color: color4,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}