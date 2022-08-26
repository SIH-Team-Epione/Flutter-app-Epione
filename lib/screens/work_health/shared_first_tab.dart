import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';

class PostsTab extends StatefulWidget {
  const PostsTab({Key? key}) : super(key: key);

  @override
  State<PostsTab> createState() => _PostsTabState();
}

class _PostsTabState extends State<PostsTab> {

    Query dbRef = FirebaseDatabase.instance.ref().child('posts');
    final currentuser = FirebaseAuth.instance.currentUser;

    handleLike(){

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
                          Text(
                            post['track'].toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
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

            return listItem(post: post);
          },
        ),
      );
    }

}


// class PostsTab extends StatefulWidget {
//   const PostsTab({Key? key}) : super(key: key);
//
//   @override
//   State<PostsTab> createState() => _PostsTabState();
// }
// class _PostsTabState extends State<PostsTab> {
//
//   String dropdownValue = 'Mental';
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Row(
//             children: [
//               DropdownButton(
//                 value: dropdownValue,
//                   icon: const Icon(Icons.arrow_downward),
//                   elevation: 16,
//                   style: const TextStyle(
//                     color: Colors.black54,
//                   ),
//                   items: <String>['Mental', 'Physical', 'Social', 'Work']
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       dropdownValue = newValue!;
//                     });
//                   },
//               )
//             ],
//           ),
//         ],
//       )
//     );
//   }
// }
