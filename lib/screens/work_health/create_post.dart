import 'package:dialogflow_grpc/generated/google/type/date.pb.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}
var dropdownValue = "Select Track";

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    var title = "";
    var postText = "";
    final TextEditingController _titleTextController = TextEditingController();
    final TextEditingController _postTextController = TextEditingController();
    String cdate1 = DateFormat("EEEEE, dd/MM/yyyy").format(DateTime.now());

    Future<void> createPost() async {
      title = _titleTextController.text;
      postText = _postTextController.text;

      DatabaseReference ref = FirebaseDatabase.instance.ref("posts");

      var currTimeInMilli = DateTime.now().millisecondsSinceEpoch;

      await ref.child(currTimeInMilli.toString()).child('uid').set(FirebaseAuth.instance.currentUser?.uid);
      await ref.child(currTimeInMilli.toString()).child('title').set(title);
      await ref.child(currTimeInMilli.toString()).child('text').set(postText);
      await ref.child(currTimeInMilli.toString()).child('name').set(FirebaseAuth.instance.currentUser?.displayName);
      await ref.child(currTimeInMilli.toString()).child('track').set(dropdownValue);
      await ref.child(currTimeInMilli.toString()).child('likes').set(0);
      await ref.child(currTimeInMilli.toString()).child('date').set(cdate1);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("New Post"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 20,),
              DropdownButton<String>(
                value: dropdownValue,
                // icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                // style: const TextStyle(color: Colors.black, fontSize: 14),
                // underline: Container(
                //   height: 2,
                //   color: Colors.black,
                // ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Select Track', 'Mental Health', 'Physical Health', 'Social Health', 'Work Health']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20,),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      controller: _titleTextController,
                      decoration: InputDecoration(hintText: "Title"),
                      showCursor: true,
                      maxLines: null,
                      // style: TextStyle(
                      //   fontSize: 14,
                      // ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      controller: _postTextController,
                      decoration: InputDecoration(hintText: "Text"),
                      showCursor: true,
                      maxLines: null,
                      // style: TextStyle(
                      //   fontSize: 14,
                      // ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25,),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal.shade100,
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Submit Post",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    )
                ),
                onTap: () {
                  createPost();
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

