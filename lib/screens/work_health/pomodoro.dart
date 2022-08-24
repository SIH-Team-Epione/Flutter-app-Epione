import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../color_pomo/colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({Key? key}) : super(key: key);

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}
double z=1500;
int a=0;
String text='Start working\nfor 25 minutes';
class _PomodoroScreenState extends State<PomodoroScreen> {
  double defaultValue = 1500;
  double value = 1500.00;
  bool isStarted = false;
  int focusedMins = 0;


  late Timer _timer;


  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: green1));
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
              text='Take break for 5 minutes';
              z=300;
              isStarted = true;
              value = 300;
            }
            else{
              timer.cancel();
              isStarted = false;

            }
          });
        } else {
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
        title:const Text("Pomodoro"),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      child:Text(
                              text,
                              style: TextStyle(
                                color:color4,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),

                            ),
                            margin: new EdgeInsets.symmetric(vertical: 40.0),
                    ),
                    Center(
                      child: SizedBox(
                        width: 250,
                        height: 250,
                        child: Stack(
                          children: [
                            SleekCircularSlider(
                              initialValue: value,
                              min: 0,
                              max: z,
                              appearance: CircularSliderAppearance(
                                customWidths: CustomSliderWidths(
                                  trackWidth: 15,
                                  handlerSize: 20,
                                  progressBarWidth: 15,
                                  shadowWidth: 0,
                                ),
                                customColors: CustomSliderColors(
                                  trackColor: green1,
                                  progressBarColor: green4,
                                  hideShadow: true,
                                  dotColor: green4,
                                ),
                                size: 250,
                                angleRange: 360,
                                startAngle: 270,
                              ),
                              onChange: (newValue) {
                                setState(() {
                                  value = newValue;
                                });
                              },
                              innerWidget: (double newValue) {
                                return Center(
                                  child: Text(
                                    "${(value ~/ 60).toInt().toString().padLeft(2, '0')}:${(value % 60).toInt().toString().padLeft(2, '0')}",
                                    style: TextStyle(
                                      color: color4,
                                      fontSize: 46,
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
                    const SizedBox(
                      height: 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (!isStarted) {
                            isStarted = true;
                            if(a==2){
                              a=0;
                              z=1500;
                              text="Start working for 25 minutes";
                              value=1500;
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
                          borderRadius: BorderRadius.circular(30),
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
                          isStarted ? "STOP" : "START",
                          style: TextStyle(
                            color: Colors.black,
                            // color: color4,

                            // fontSize: 24,
                            fontSize: 20,

                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


