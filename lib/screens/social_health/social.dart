import 'index.dart';
import 'package:flutter/material.dart';
import 'contacts.dart';

class Social extends StatefulWidget {
  const Social({Key? key}) : super(key: key);

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Social Health',
          style: TextStyle(color: Colors.white70),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/family.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 201, 176, 176),
                    offset: Offset(5.0, 5.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                    'Give The Ones You Love The Wings To Fly, Roots To Come Back And Reasons To Stay',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(height: 10.0),
            // Container(
            //   padding: EdgeInsets.all(10.0),
            //   margin: EdgeInsets.all(10.0),
            //   decoration: BoxDecoration(
            //     color: Color.fromARGB(99, 235, 172, 172),
            //     border: Border.all(color: Colors.black),
            //     borderRadius: BorderRadius.circular(10.0),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Color.fromARGB(255, 201, 176, 176),
            //         offset: Offset(5.0, 5.0),
            //         blurRadius: 6.0,
            //       ),
            //     ],
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[
            //       Text(
            //         'Connect with Family',
            //         style: TextStyle(
            //           fontSize: 15.0,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       IconButton(
            //           onPressed: () {
            //             Navigator.push(context, MaterialPageRoute(builder: (_) {
            //               return Contacts();
            //             }));
            //           },
            //           icon: Icon(Icons.arrow_circle_right)),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 244, 247),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 198, 196, 196),
                    offset: Offset(5.0, 5.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Connect with Friend and Family',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Contacts();
                        }));
                      },
                      icon: Icon(Icons.arrow_circle_right)),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 244, 247),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 198, 196, 196),
                    offset: Offset(5.0, 5.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Take breaks from Social Media',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_circle_right)),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'More Feature',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return IndexPage();
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(0.0, 5.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Video Conferencing'),
                          Text('and'),
                          Text('Panel Discussion'),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/VideoCall.webp'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 254, 254, 254),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(0.0, 5.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Solve Puzzles/Riddles '),
                        Text('and'),
                        Text('Brainstorm over Fun Quiz'),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/Group.jpg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
