import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class CreateSharedLearningPost extends StatefulWidget {
  const CreateSharedLearningPost({Key? key}) : super(key: key);

  @override
  State<CreateSharedLearningPost> createState() => _CreateSharedLearningPostState();
}

class _CreateSharedLearningPostState extends State<CreateSharedLearningPost> {
    @override
  Widget build(BuildContext context) {
    var title = "";
    var postText = "";
    final TextEditingController _titleTextController = TextEditingController();
    final TextEditingController _postTextController = TextEditingController();

    Future<void> createPost() async {
      title = _titleTextController.text;
      postText = _postTextController.text;

      DatabaseReference ref = FirebaseDatabase.instance.ref("learnings");

      var currTimeInMilli = DateTime.now().millisecondsSinceEpoch;

      await ref.child(currTimeInMilli.toString()).child('uid').set(FirebaseAuth.instance.currentUser?.uid);
      await ref.child(currTimeInMilli.toString()).child('title').set(title);
      await ref.child(currTimeInMilli.toString()).child('text').set(postText);
      await ref.child(currTimeInMilli.toString()).child('name').set(FirebaseAuth.instance.currentUser?.displayName);
      await ref.child(currTimeInMilli.toString()).child('likes').set(0);

    }

    return Scaffold(
      appBar: AppBar(
        title: Text("New Post"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 100.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller: _titleTextController,
                decoration: InputDecoration(hintText: "Title"),
                showCursor: true,
                maxLines: null,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller: _postTextController,
                decoration: InputDecoration(hintText: "Text"),
                showCursor: true,
                maxLines: null,
              ),
            ),
            SizedBox(height: 25.0,),
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
    );
  }
}
