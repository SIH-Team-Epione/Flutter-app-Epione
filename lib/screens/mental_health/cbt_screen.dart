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
        itemCount: cbtSteps.length,
      ),
    );
  }
}

Widget _buildCBTRow(int index, BuildContext context) {
  return Container(
    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          color: Colors.teal.shade50,
          blurRadius: 10,
          spreadRadius: 5,
        )
      ]
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                color: Colors.teal.shade100,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  color: Colors.teal.shade200,
                  child: Text(
                    cbtSteps[index].headline,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: ((MediaQuery.of(context).size.width) / 16.0) * 9.0,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/cbt/Frame${index+1}.png'),
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