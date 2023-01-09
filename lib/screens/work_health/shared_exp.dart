import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/work_health/create_post.dart';
import 'package:quiz_app/screens/work_health/shared_first_tab.dart';
import 'package:quiz_app/screens/work_health/shared_second_tab.dart';

import '../SharedLearnings.dart';

class SharedExperiences extends StatefulWidget {
  const SharedExperiences({Key? key}) : super(key: key);

  @override
  State<SharedExperiences> createState() => _SharedExperiencesState();
}

class _SharedExperiencesState extends State<SharedExperiences> {

  void createPost(){
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => CreatePostScreen())
    );
  }

  Query dbRef = FirebaseDatabase.instance.ref().child('posts');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xffe0f4f0),
        appBar: AppBar(
          title: Text('Shared Experiences'),
          centerTitle: false,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Posts',
              ),
              Tab(
                text: 'My Posts',
              )
            ],
          ),
        ),
          floatingActionButton: FloatingActionButton(
            onPressed: createPost,
            child: Icon(Icons.add),
          ),
        body: TabBarView(
          children: [
            PostsTab(),
            MyPostsTab(),
          ],
        )
      ),
    );
  }
}





