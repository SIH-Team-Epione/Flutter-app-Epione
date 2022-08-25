
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:quiz_app/screens/work_health/shared_first_tab.dart';

class CrudMethods{

  void saveToDatabase(url){
    var dbTimeKey = new DateTime.now();
    var formatDate = new DateFormat('MMM d, yyyy');
    var formatTime = new DateFormat('EEEE, hh:mm aaa');

    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);

    DatabaseReference ref = FirebaseDatabase.instance.reference();

    var data = {
      "image":url,
      //"description": _myValue,
      "date":date,
      "time":time,

    };

    ref.child("Posts").push().set(data);
  }

  void goToHomePage(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context){
          return new PostsTab();
        })
    );
  }
}