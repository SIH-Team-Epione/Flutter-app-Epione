import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/create_shared_learning_post.dart';

class SharedLearnings extends StatefulWidget {
  const SharedLearnings({Key? key}) : super(key: key);

  @override
  State<SharedLearnings> createState() => _SharedLearningsState();
}

//If user chooses to view his posts only just use this list
List<Map<dynamic, dynamic>> myLearnings = [];
List<Map<dynamic, dynamic>> allLearnings = [];

//track chosen by user
var track = "";

class _SharedLearningsState extends State<SharedLearnings> {

  void createPost(){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => CreateSharedLearningPost()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Learnings"),
      ),
      body: PostsSection(),
      floatingActionButton: FloatingActionButton(
        onPressed: createPost,
      ),
    );
  }
}


class PostsSection extends StatefulWidget {
  const PostsSection({Key? key}) : super(key: key);

  @override
  State<PostsSection> createState() => _PostsSectionState();
}

class _PostsSectionState extends State<PostsSection> {

  Query dbRef = FirebaseDatabase.instance.ref().child('learnings');

  Widget listItem({required Map post}){
     return Container(
        child: Column(
          children: [
            Text(post['title'].toString()),
            Text(post['likes'].toString()),
            Text(post['text'].toString()),
            Text(post['name'].toString())
          ],
        ),
     );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: FirebaseAnimatedList(
        query: dbRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
          Map post = snapshot.value as Map;
          post['key'] = snapshot.key;
          allLearnings.add(post);
          if(post['uid']==(FirebaseAuth.instance.currentUser?.uid)){
            myLearnings.add(post);
          }
          return listItem(post: post);
        },
      ),
    );
  }
}

List<Map<dynamic, dynamic>> filter(String track){
  List<Map<dynamic, dynamic>> filteredList = [];
  for(var p in allLearnings){
    if(p['track']==track){
      filteredList.add(p);
    }
  }
  return filteredList;
}
