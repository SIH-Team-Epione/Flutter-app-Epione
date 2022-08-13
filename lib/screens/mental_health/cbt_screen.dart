import 'package:flutter/material.dart';
import 'package:quiz_app/models/CbtSteps.dart';


class CBTScreen extends StatefulWidget {
  const CBTScreen({Key? key}) : super(key: key);

  @override
  State<CBTScreen> createState() =>
      _CBTScreenState();
}

class _CBTScreenState
    extends State<CBTScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cognitive Therapy"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: _buildCBTRow(index, context),
        ),
        itemCount: 2,
      ),
    );
  }
}

Widget _buildCBTRow(int index, BuildContext context) {
  return Card(
    elevation: 10,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                child: Text(
                  cbtSteps[index].headline,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              )
            ],
          ),
          Container(
            height: ((MediaQuery.of(context).size.width) / 16.0) * 6.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.deepOrange),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              cbtSteps[index].description,
              style: TextStyle(),
            ),
          )
        ],
      ),
    ),
  );
}