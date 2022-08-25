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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

