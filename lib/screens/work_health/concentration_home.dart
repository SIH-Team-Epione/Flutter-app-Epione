import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/work_health/concentration_techniques/app-timers.dart';
import 'concentration_techniques/distractions.dart';
import 'concentration_techniques/multitasking.dart';
import 'concentration_techniques/player.dart';
import 'concentration_techniques/todays-tip.dart';

void main() {
  runApp(MaterialApp(
    home: ConcentrationHomeScreen(),
  ));
}

class ConcentrationHomeScreen extends StatelessWidget {
  const ConcentrationHomeScreen({key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Increase Concentration'),
        ),
        body: Container(
            color: Color(0xFFFAFAFA),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Tips(),
                  Column(
                      children: [
                        BuildCard(1, 'https://domf5oio6qrcr.cloudfront.net/medialibrary/11743/5fe19ffb-2adb-4c15-a66d-70bb6f33da16.jpg', 'Eliminate distractions', 'Distractions such as social media can affect your focus. If you want to concentrate, try our focus mode to block unnecessary notifications!', context),
                        BuildCard(2, 'https://img.freepik.com/free-vector/business-man-dealing-multi-task-new-idea-working-laptop-concept-business-goals-success-satisfying-achievement_1150-39765.jpg?w=996&t=st=1661110478~exp=1661111078~hmac=40546a2dd505842865dfa173d87a741aa2c74c517f09dd254a12c0611a412cdb', 'Reduce multitasking', "For increased concentration on a task, let's try to reduce multitasking in our daily life and focus on one task at a time!", context),
                        BuildCard(3, 'https://media.istockphoto.com/vectors/work-pause-take-break-concept-vector-id1187579395?k=20&m=1187579395&s=612x612&w=0&h=8o4ddacearZq0Ip5QAF7MBw2xrwY6fox_pHTDpztTPc=', 'Concentration sounds', "Using nature sounds or white noise to mask background sounds could also help improve concentration and other brain functions. Try it out!", context),
                        BuildCard(4, 'https://img.freepik.com/free-vector/people-using-their-mobile-phones-news_52683-39976.jpg?w=2000', 'Set App Timers', "Set daily timers for apps to limit excessive usage, try it for setting goals on screen time for each app!", context)
                      ]
                  )
                ],
              ),
            )
        )
    );
  }

  Widget BuildCard(int key, String imgUrl, String title, String desc, BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Ink.image(
                image: NetworkImage(imgUrl),
                height: 175.0,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 12.0,
                right: 16.0,
                left: 18.0,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Text(
              desc,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  switch(key) {
                    case 1 : Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => EliminateDistractions()),
                    );
                    break;
                    case 2: Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => ReducingMultiTasking()),
                    );
                    break;
                    case 3: Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => MusicPlayer()),
                    );
                    break;
                    case 4: Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => AppTimer()),
                    );
                    break;
                  }
                },
                color: Color(0xFFFEBD40),
                iconSize: 30.0,
                icon: Icon(Icons.arrow_forward_rounded),
                alignment: Alignment.topLeft,
              ),
              SizedBox(width: 12.0),
            ],
          )
        ],
      ),
    );
  }

}

class Tips extends StatefulWidget {
  @override
  State<Tips> createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Dismissible(
        key: Key('tips'),
        child: Container(
          color: Color(0xFFF6D6D7),
          child: Row(
            children: <Widget> [
              Expanded(
                flex: 2,
                // padding: const EdgeInsets.fromLTRB(5.0, 2.0, 0.0, 2.0),
                child: Icon(
                  Icons.lightbulb,
                  color: Color(0xFFFEBD40),
                  size: 28.0,
                ),
              ),
              Expanded(
                flex: 10,
                // padding: const EdgeInsets.fromLTRB(8.0, 2.0, 220.0, 2.0),
                child: RichText(
                  text: TextSpan(
                      text: 'Tip of the day',
                      // text: 'Tips to increase concentration',
                      // children: [
                      //   Container(padding: EdgeInsets.only(bottom: 5.0)),
                      // ],
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.0
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => TodaysTip()),
                          );
                          print('I was clicked');
                        }
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = false;
                    });
                  },
                  icon: Icon(Icons.close_rounded),
                  color: Color(0xFF293241),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
