import 'PSQI.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'heart.dart';

// String formatDate(DateTime d) {
//   return d.toString().substring(0, 19);
// }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _customTileExpanded = false;

  // late Stream<StepCount> _stepCountStream;
  // late Stream<PedestrianStatus> _pedestrianStatusStream;
  // String _status = '?', _steps = '?';

  // @override
  // void initState() {
  //   super.initState();
  //   initPlatformState();
  // }

  // void onStepCount(StepCount event) {
  //   print(event);
  //   setState(() {
  //     _steps = event.steps.toString();
  //   });
  // }

  // void onPedestrianStatusChanged(PedestrianStatus event) {
  //   print(event);
  //   setState(() {
  //     _status = event.status;
  //   });
  // }

  // void onPedestrianStatusError(error) {
  //   print('onPedestrianStatusError: $error');
  //   setState(() {
  //     _status = 'Pedestrian Status not available';
  //   });
  //   print(_status);
  // }

  // void onStepCountError(error) {
  //   print('onStepCountError: $error');
  //   setState(() {
  //     _steps = 'Step Count not available';
  //   });
  // }

  // void initPlatformState() {
  //   _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
  //   _pedestrianStatusStream
  //       .listen(onPedestrianStatusChanged)
  //       .onError(onPedestrianStatusError);

  //   _stepCountStream = Pedometer.stepCountStream;
  //   _stepCountStream.listen(onStepCount).onError(onStepCountError);

  //   if (!mounted) return;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 244, 247),
      appBar: AppBar(
        title: Text(
          'Guide to Physical Well Being',
          style: TextStyle(color: Colors.white70),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Divider(
              height: 20.0,
              color: Colors.grey[300],
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.access_time),
                      Image(
                        image: AssetImage('assets/images/Steps.jpg'),
                        width: 200,
                        height: 300,
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal[50],

                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 195, 197, 211),
                          offset: Offset(0.0, 5.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Container(

                      child: ExpansionTile(
                        title: Text(
                          'Count of Steps',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          _customTileExpanded
                              ? Icons.arrow_drop_down
                              : Icons.arrow_right_outlined,
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              'Steps Taken:',
                              style: TextStyle(
                                color: Color.fromARGB(255, 38, 71, 64),
                              ),
                            ),
                            // subtitle: Text(
                            //   _steps,
                            //   style: TextStyle(
                            //     color: Color.fromARGB(255, 127, 160, 153),
                            //   ),
                            // ),
                          ),
                          ListTile(
                            title: Text(
                              'Pedstrian status:',
                              style: TextStyle(
                                color: Color.fromARGB(255, 38, 71, 64),
                              ),
                            ),
                            //subtitle: Text(
                            // _status,
                            // style: _status == 'walking' || _status == 'stopped'
                            //     ? TextStyle(fontSize: 30)
                            //     : TextStyle(fontSize: 20, color: Colors.red),
                            // ),
                          ),
                        ],
                        onExpansionChanged: (bool expanded) {
                          setState(() => _customTileExpanded = expanded);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Divider(
              height: 20.0,
              color: Colors.grey[300],
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.bedtime),
                      Image(
                        image: AssetImage('assets/images/Sleep.webp'),
                        width: 200,
                        height: 300,
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal[50],

                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 195, 197, 211),
                          offset: Offset(0.0, 5.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Container(
                      child: ExpansionTile(
                        title: Text(
                          'Sleep',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          _customTileExpanded
                              ? Icons.arrow_drop_down
                              : Icons.arrow_right_outlined,
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              'Sleep Quality Assessment (PSQI)',
                              style: TextStyle(
                                color: Color.fromARGB(255, 38, 71, 64),
                              ),
                            ),
                            subtitle: Text(
                              'Use this effective tool to measure the quality/pattern of your sleep as it differentiates between poor and quality sleep by measuring 7 areas.',
                              style: TextStyle(
                                color: Color.fromARGB(255, 127, 160, 153),
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward,
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return Psqi();
                              }));
                            },
                          ),
                        ],
                        onExpansionChanged: (bool expanded) {
                          setState(() => _customTileExpanded = expanded);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Divider(
              height: 20.0,
              color: Colors.grey[300],
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.monitor_heart_outlined),
                      Image(
                        image: AssetImage('assets/images/Heart.jpg'),
                        width: 200,
                        height: 300,
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal[50],

                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 195, 197, 211),
                          offset: Offset(0.0, 5.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Container(
                      child: ExpansionTile(
                        title: Text(
                          'Count of Heartbeats',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          _customTileExpanded
                              ? Icons.arrow_drop_down
                              : Icons.arrow_right_outlined,
                        ),
                        children: <Widget>[
                          // ListTile(
                          //     title: Text(
                          //   '',
                          //   style: TextStyle(
                          //     color: Color.fromARGB(255, 127, 160, 153),
                          //   ),
                          // ),

                          // ),
                          ListTile(
                            title: Text(
                              'Access your Heartbeat',
                              style: TextStyle(
                                color: Color.fromARGB(255, 38, 71, 64),
                              ),
                            ),
                            subtitle: Text(
                              'Get access to your heartbeat and examine it closely to understand if its perfectly fine.',
                              style: TextStyle(
                                color: Color.fromARGB(255, 127, 160, 153),
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward,
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return Heart();
                              }));
                            },
                          ),
                        ],
                        onExpansionChanged: (bool expanded) {
                          setState(() => _customTileExpanded = expanded);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(10.0),
            //   margin: EdgeInsets.all(10.0),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(color: Colors.black),
            //     borderRadius: BorderRadius.circular(10.0),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Color.fromARGB(255, 195, 197, 211),
            //         offset: Offset(0.0, 5.0),
            //         blurRadius: 6.0,
            //       ),
            //     ],
            //   ),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Icon(Icons.mediation_rounded),
            //           Image(
            //             image: AssetImage('assets/mind.png'),
            //             width: 200,
            //             height: 300,
            //           ),
            //           Icon(
            //             Icons.arrow_circle_right_outlined,
            //             color: Colors.white,
            //           ),
            //         ],
            //       ),
            //       // Container(
            //       //   child: ExpansionTile(
            //       //     title: Text(
            //       //       'Mindfulness',
            //       //       style: TextStyle(
            //       //         fontSize: 15.0,
            //       //         fontWeight: FontWeight.bold,
            //       //       ),
            //       //     ),
            //       //     trailing: Icon(
            //       //       _customTileExpanded
            //       //           ? Icons.arrow_drop_down
            //       //           : Icons.arrow_right_outlined,
            //       //     ),
            //       //     children: const <Widget>[
            //       //       ListTile(
            //       //           title: Text(
            //       //         ' ',
            //       //         style: TextStyle(
            //       //           color: Color.fromARGB(255, 127, 160, 153),
            //       //         ),
            //       //       )),
            //       //     ],
            //       //     onExpansionChanged: (bool expanded) {
            //       //       setState(() => _customTileExpanded = expanded);
            //       //     },
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 10.0),
            Divider(
              height: 20.0,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
