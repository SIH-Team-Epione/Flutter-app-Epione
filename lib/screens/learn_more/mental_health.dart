import 'package:flutter/material.dart';

class LearnMoreMentalScreen extends StatefulWidget {
  const LearnMoreMentalScreen({Key? key}) : super(key: key);

  @override
  State<LearnMoreMentalScreen> createState() => _LearnMoreMentalScreenState();
}

class _LearnMoreMentalScreenState extends State<LearnMoreMentalScreen> {
  final String image = "assets/images/mental_learn_more.jpg";
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
                    "Learn more about\nMental health",
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
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.circle,
                                      color: Colors.teal,
                                    ),
                                    Icon(
                                      Icons.circle_outlined,
                                      color: Colors.teal,
                                    ),
                                    Icon(
                                      Icons.circle_outlined,
                                      color: Colors.teal,
                                    ),
                                    Icon(
                                      Icons.circle_outlined,
                                      color: Colors.teal,
                                    ),

                                  ],
                                ),
                                Text.rich(TextSpan(children: [
                                  WidgetSpan(
                                      child: Icon(Icons.location_on, size: 16.0, color: Colors.grey,)
                                  ),
                                  TextSpan(
                                      text: "You are on track 1"
                                  )
                                ]), style: TextStyle(color: Colors.grey, fontSize: 12.0),)
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text("\$ 0", style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              ),),
                              Text("Our features are free!",style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey
                              ),)
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            backgroundColor: Colors.teal,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 32.0,
                            ),
                          ),
                          child: Text("Further Reading", style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white
                          ),),
                          onPressed: () {
                            Navigator.pushNamed(context, '/further_read_mental');
                          },
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text("Mental health and students".toUpperCase(), style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0
                      ),),
                      const SizedBox(height: 10.0),
                      Text(
                        "In this era of the competitive academic field, stress and excess pressure can have a devastating effect on the students. One of the most crucial aspects of a student’s path to success is mental health. Without balanced mental health, students fail to focus on their studies, and as such, their grades slip, leading to more anxiety and nervousness. Thus, it is important to be aware that mental health can significantly impact students.",
                        textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0
                      ),),
                      const SizedBox(height: 10.0),
                      Text(
                        "What is mental health?",
                        textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0
                      ),),
                      const SizedBox(height: 10.0),
                      Text(
                        "“Mental health is a state of mental well-being that enables people to cope with the stresses of life, realize their abilities, learn well and work well, and contribute to their community.”",
                        textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0
                      ),),
                      const SizedBox(height: 10.0),
                      Text(
                        "The WHO states that mental health is “more than just the absence of mental disorders or disabilities.” Peak mental health is not only about managing active conditions but also looking after ongoing wellness and happiness.",
                        textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0
                      ),),
                      const SizedBox(height: 10.0),
                      Text(
                        "It also emphasizes that preserving and restoring mental health is crucial individually and at a community and society level.",
                        textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0
                      ),),
                      const SizedBox(height: 10.0),
                      Text(
                        "Mental health is also strongly linked with the physical health of a student. It is true that mental health is more crucial for students as they are vulnerable compared to adults. That is because students have to adapt to the changing environments in order to thrive constantly. With the increase in academic demands, it is vital to prioritize work and manage efficiently.",
                        textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0
                      ),),
                      const SizedBox(height: 10.0),
                      Text(
                        "Our goal",
                        textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0
                      ),),
                      const SizedBox(height: 10.0),
                      Text(
                        "Hence, in order to help students cope with various mental health issues that they face along their journeys we have provided various features integrated within the app, carefully compiling them to provide students mental health facilities free of cost. We understand that often times students are not willing to talk about their issues. Using Epione, students can utilize scientifically proven ways to improve their mental health state and lead better lives without intervention of third parties.",
                        textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0
                      ),),
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
