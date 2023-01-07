import 'package:flutter/material.dart';

class LearnMoreSocialScreen extends StatefulWidget {
  const LearnMoreSocialScreen({Key? key}) : super(key: key);

  @override
  State<LearnMoreSocialScreen> createState() => _LearnMoreSocialScreenState();
}

class _LearnMoreSocialScreenState extends State<LearnMoreSocialScreen> {
  final String image = "assets/images/social_learn_more.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(color: Colors.black26),
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
                    "Learn more about\nSocial health",
                    style: TextStyle(
                        color: Colors.white,
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
                                      Icons.circle,
                                      color: Colors.teal,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: Colors.teal,
                                    ),
                                    Icon(
                                      Icons.circle_outlined,
                                      color: Colors.teal,
                                    ),
                                  ],
                                ),
                                Text.rich(
                                  TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.location_on,
                                      size: 16.0,
                                      color: Colors.grey,
                                    )),
                                    TextSpan(text: "You are on track 3")
                                  ]),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "\$ 0",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Text(
                                "Our features are free!",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            foregroundColor: Colors.teal,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 32.0,
                            ),
                          ),
                          child: Text(
                            "More on social self care",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/more_social_health');
                          },
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "What is social health".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Technically, it is the ability of the people to be free from want of basic necessities and to coexist peacefully in communities with opportunities for advancement or well-being stands for absence of negative conditions and feelings and if not the total absence then presence of more positive feelings than negative ones." +
                            'It can be defined as our ability to interact and form meaningful relationships with others. It also relates to how comfortably we can adapt in social situations. Social relationships have an impact on our mental health, physical health and mortality risk.  ' +
                            'Hence, it is an important aspect of self care.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Signs that you're socially healthy".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Signs of good social health include:" +
                            "\n\n> Balancing your social and personal time" +
                            "\n> Being your true self at all times" +
                            "\n> Engaging with people in your community" +
                            "\n> Treating others with respect" +
                            "\n> Maintaining and building strong relationships with friends" +
                            "\n> Creating healthy boundaries that help with communication, trust and conflict management" +
                            "\n> Turning to friends and family for support" +
                            "\n> Communicating effectively",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Our aim".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "The outbreak of COVID-19 affected the lives of all sections of society as people were asked to self-quarantine in their homes to prevent the spread of the virus. The lockdown had serious implications on mental health, resulting in psychological problems including frustration, stress, and depression and also loneliness and isolation." +
                            "\n\nHence, our aim is to provide students a means to stay connected to their close friends and family." +
                            "\n\nAs social connections were lost, students' social well-being was severely affected. Our app aims to undo this by providing the features to connect with loved ones as studies have shown how crucial it can be when it comes to a person's overall well being.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
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
              title: Text(
                "LEARN MORE",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
