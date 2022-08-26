import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/create_shared_learning_post.dart';
import 'package:quiz_app/screens/work_health/shared_learning_first_tab.dart';
import 'package:quiz_app/screens/work_health/shared_learning_second_tab.dart';

class SharedLearnings extends StatefulWidget {
  const SharedLearnings({Key? key}) : super(key: key);

  @override
  State<SharedLearnings> createState() => _SharedLearningsState();
}

//track chosen by user
var track = "";

class _SharedLearningsState extends State<SharedLearnings> {

  void createPost(){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => CreateSharedLearningPost()));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xffe0f4f0),
        appBar: AppBar(
          title: Text("Shared Learnings"),
          bottom: TabBar(
            tabs: [
              Tab(text: "All Posts",),
              Tab(text: "My Posts"),
            ],
          ),
        ),
        body: TabBarView(
          children:[
            PostsTabLearning(),
            MyPostsTabLearning()
          ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createPost,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
