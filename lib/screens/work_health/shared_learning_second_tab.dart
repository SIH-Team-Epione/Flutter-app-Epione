import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class MyPostsTabLearning extends StatefulWidget {
  const MyPostsTabLearning({Key? key}) : super(key: key);

  @override
  State<MyPostsTabLearning> createState() => _MyPostsTabLearningState();
}

class _MyPostsTabLearningState extends State<MyPostsTabLearning> {

  Query dbRef = FirebaseDatabase.instance.ref().child('learnings');
  final currentuser = FirebaseAuth.instance.currentUser;

  handleLike(){

  }

  Widget empty({required Map post}){
    final userId = currentuser?.uid;
    return Container(
      width: 0,
      height: 0,
    );
  }

  Widget listItem({required Map post}){
    final userId = currentuser?.uid;
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 15),
      width: 460,
      height: 160,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0,10.0),
              blurRadius: 10.0,
              spreadRadius: 0.5
          )]
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 0.0),
        child: Expanded(
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: handleLike,
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                                size: 12.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              post['likes'].toString(),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      height: 35,
                      child: Text(
                        post['title'].toString(),
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Flexible(
                        child: Text(
                          post['text'].toString(),
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              color: Colors.grey,
                              size: 12.0,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              post['date'].toString(),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 20.0),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 12.0,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              post['name'].toString(),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
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
          if(post['uid']!=FirebaseAuth.instance.currentUser!.uid){
            return empty(post: post);
          }
          return listItem(post: post);
        },
      ),
    );
  }
}
