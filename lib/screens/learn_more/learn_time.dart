import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LearnTimeScreen extends StatefulWidget {
  const LearnTimeScreen({Key? key}) : super(key: key);

  @override
  State<LearnTimeScreen> createState() => _LearnTimeScreenState();
}

class _LearnTimeScreenState extends State<LearnTimeScreen> {

  late YoutubePlayerController controller;

  final String image = "assets/images/time_learn.jpg";

  @override
  void initState() {
    super.initState();

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(
                  color: Colors.black26
              ),
              height: 400,
              child: Image.asset(image, fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Time\nManagement",
                    style: TextStyle(color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "An aspect of self care",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 30.0),

                      Text("What all does this encompass?".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0
                        ),),
                      const SizedBox(height: 10.0),
                      Text(
                        "Effective time management is the productive use of your time, allowing you to get everything you had planned done. It’s organizing and planning your time between the tasks you have to complete. This can include assignments, projects, study groups, or extracurriculars. Proper time management requires you to shift from focusing on activities to results. Being busy doesn’t mean you are effective. With good time management, you complete your tasks with minimal effort and make most of your time, working smarter, not harder."
                            +
                            "\n\nDifferent people need different effective time management strategies. If you’re a graduate student, you may choose to manage your time in a different way than someone who is a working mother. If you’re a visual person, you may prefer a color-coded calendar over a written to do list.\n\nFiguring out a process that works for you, whatever that may be, is key to creating your most efficient life. To help you improve poor time management, we’ve explored nine popular techniques, from the 80/20 rule to the “eat that frog” method. We’ve outlined what they are, how to implement them, and the types of people who most benefit from them. And, check out our infographic below that includes a flowchart to help you decide which time management process will work the best for you.",
                        textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0
                      ),),
                      const SizedBox(height: 20.0),
                      Image.asset('assets/images/time_flowchart.jpg'),

                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text("LEARN MORE", style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
