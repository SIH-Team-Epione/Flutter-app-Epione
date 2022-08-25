import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/work_health/create_post.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User posts"),
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

  Query dbRef = FirebaseDatabase.instance.ref().child('posts');

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

          return listItem(post: post);
        },
      ),
    );
  }
}

