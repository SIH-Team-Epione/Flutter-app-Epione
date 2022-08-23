import 'package:flutter/material.dart';

import 'package:heart_bpm/heart_bpm.dart';

class Heart extends StatefulWidget {
  Heart({
    Key? key,
  }) : super(key: key);
  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  /// list to store raw values in
  List<SensorValue> data = [];

  /// variable to store measured BPM value
  late int bpmValue;

  bool isBPMEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 244, 247),
      appBar: AppBar(
        title: Text(
          'Heartbeat Count',
          style: TextStyle(color: Colors.white70),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  'Click the button below and put your finger on the camera of your device\n',
                  style: TextStyle(
                    color: Colors.teal[100],
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            isBPMEnabled
                ? HeartBPMDialog(
                    context: context,
                    onRawData: (value) {
                      setState(() {
                        // add raw data points to the list
                        // with a maximum length of 100
                        if (data.length == 100) data.removeAt(0);
                        data.add(value);
                      });
                    },
                    onBPM: (value) => setState(() {
                      bpmValue = value;
                    }),
                  )
                : SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.favorite_rounded),
                label: Text(isBPMEnabled ? "Stop measurement" : "Measure BPM"),
                onPressed: () => setState(() => isBPMEnabled = !isBPMEnabled),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
