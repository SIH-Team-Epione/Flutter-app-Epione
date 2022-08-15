import 'package:flutter/material.dart';

class LearnTimeScreen extends StatefulWidget {
  const LearnTimeScreen({Key? key}) : super(key: key);

  @override
  State<LearnTimeScreen> createState() => _LearnTimeScreenState();
}

class _LearnTimeScreenState extends State<LearnTimeScreen> {

  final String image = "assets/images/time_learn.jpg";
  @override
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
            padding: const EdgeInsets.only(top: 16.0,bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: Text(
                    "Time\nManagement",
                    style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
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

                      Text("What all does this encompass?".toUpperCase(), style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0
                      ),),
                      const SizedBox(height: 10.0),
                      Text(
                        "Effective time management is the productive use of your time, allowing you to get everything you had planned done. It’s organizing and planning your time between the tasks you have to complete. This can include assignments, projects, study groups, or extracurriculars. Proper time management requires you to shift from focusing on activities to results. Being busy doesn’t mean you are effective. With good time management, you complete your tasks with minimal effort and make most of your time, working smarter, not harder."
                        +"\n\nDifferent people need different effective time management strategies. If you’re a graduate student, you may choose to manage your time in a different way than someone who is a working mother. If you’re a visual person, you may prefer a color-coded calendar over a written to do list.\n\nFiguring out a process that works for you, whatever that may be, is key to creating your most efficient life. To help you improve poor time management, we’ve explored nine popular techniques, from the 80/20 rule to the “eat that frog” method. We’ve outlined what they are, how to implement them, and the types of people who most benefit from them. And, check out our infographic below that includes a flowchart to help you decide which time management process will work the best for you.",
                        textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0
                      ),),
                      const SizedBox(height: 30.0),
                      Text("1. Pareto Analysis (a.k.a., the 80/20 rule)",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0
                      ),),
                      const SizedBox(height: 10.0),
                      Text("The 80/20 rule is a technique created by the Italian economist Vilfredo Pareto. It’s the idea that 20% of actions are responsible for 80% of outcomes. The goal of Pareto analysis is to help you prioritize tasks that are most effective at solving problems.",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0
                        ),),
                      Text("How it works:",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0
                        ),),
                      const SizedBox(height: 10.0),
                      Text("List some of the problems you are facing. For example, maybe your grades are slipping."
                          "\n1. Identify the root cause of each problem. Maybe your grades are slipping because you spend too much time on social media or any other sort of distraction."
                          "\n2. Assign a score to each problem: Assign higher numbers to more important problems"
                          '\n3. Group problems together by cause: Group together all the problems caused by spending too much time on social media.'
                          '\n 4. Add up the score of each group: The group with the highest score is the issue you should work on first.'
                          '\n5. Take action.',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0
                        ),),
                      const SizedBox(height: 10.0),
                      Image.asset(
                          'assets/images/learn_pareto.jpg',
                        width: MediaQuery.of(context).size.width,
                      ),
                      const SizedBox(height: 20.0),
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
              title: Text("LEARN MORE",style: TextStyle(
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
