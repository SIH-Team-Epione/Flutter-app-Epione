import 'package:flutter/material.dart';
import 'package:quiz_app/models/further_social_list.dart';

class FurtherReadSocialScreen extends StatefulWidget {

  const FurtherReadSocialScreen({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<FurtherReadSocialScreen> createState() => _FurtherReadSocialScreenState();
}

class _FurtherReadSocialScreenState extends State<FurtherReadSocialScreen> {

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
              child: Image.asset(
                  articlesList[widget.index].urlImage,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0,bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: Text(
                    articlesList[widget.index].title,
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
                        "Gain a holistic overview of mental health",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 25,),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if(widget.index == 0)...list0
                      else if(widget.index == 1)...list1
                      else if(widget.index == 2)...list2
                        else if(widget.index == 3)...list3
                          // else if(widget.index == 4)...list4
                          //   else if(widget.index == 5)...list5
                          //     else if(widget.index == 6)...list6
                          //       else if(widget.index == 7)...list7
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

//index == 0 means Dimensions of Social Health
List<Widget> list0 = [
  Text(
    "According to Corey Lee M. Keyes, there are 5 dimensions of social health and well- being i.e social integration, social contribution, social coherence, social actualization and social acceptance.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text("1. Social integration", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "It is the feeling as a part of society. It explains the extent to which feelings of an individual are related to the society and community. It reflects the commonness of an individual with the others along with the sense of belonging. For being socially integrated, the interdependence on others through norms and fondness is must. Lack of social integration leads to estrangement from society and individual feels socially rejected.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text("2. Social Contribution", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "It is feeling of an individual’s value in society. It reflects self-obligation of a person towards others and whether the behavior of a person affects the society as a whole. To contribute socially, an individual must feel responsible to give something valuable to the world. If not able to do so then an individual may feel alienated from the society. As per Erikson, midlife is the period adults can contribute most to the society and shape the coming generation into productive members of society.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text("3. Social coherence", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "It is a state where an individual or a group interact with each other. Interaction among people give rise to new ideas and ability to maintain coherence when faced with undesired and stressful life events.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text("4. Social actualization", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "It is positive comfort level with others. There is openness to ideas, efforts and experiences to grow continually. People who can envision this potential in themselves are socially healthy. They realize that they have the ability to make society better and healthier and in turn, they will be the beneficiaries of the social growth.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text("5. Social acceptance", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "It is the ability of a person to accept the good and tolerate the bad in society. In order to fit in the community, an individual might behave like others around him/her. People exhibit this behavior to feel comfortable in society. An individual with good understanding of self and who accepts both good and bad in self is known to have a good social and mental health. Thus, it can be said that the self-acceptance is necessary for social acceptance of others.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),


];

//index == 1 means Strategies to improve
List<Widget> list1 = [
  Text("Make connections", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text(
    "Develop new hobbies by joining groups of reading, drawing, writing, yoga etc.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Learn new skills like art, dance, cooking, swimming etc.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Volunteer at schools or events outside.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Travel and meet new people.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text("Get active", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text(
    "Participate in debates and discussions.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Join an exercise group or start new outdoor activities with friends.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Help parents in household chores.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text("Build healthy relations", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text(
    "Share your feeling with parents or friends.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Ask for help in need.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Listen to others without being judgmental.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Compromise and work on agreements.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Avoid conflicts and anger.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
];

//index == 2 Signs that you are socially healthy
List<Widget> list2 = [
  Text("You balance your alone and social time", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Everyone needs a different ratio of alone versus social time. Introverted people may need more solitude, but extroverted people might need the reverse. Either way, you know how to stay connected with your friends while taking care of yourself. Finding and striking the right balance means you’re socially healthy.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text("You’re assertive but not aggressive", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "You know how to communicate your needs and set healthy boundaries, and you can do it without experiencing negative emotions. That is, you don’t feel angry or resentful when you state your needs. You also don’t feel apologetic, fearful, or ashamed.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text("You can be yourself", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Healthy connections should make you feel comfortable in your skin, not the opposite. You feel a sense of belonging, meaning that you’re seen for who you are, valued, appreciated, and accepted. Being yourself means not covering or feeling ashamed or afraid of exclusion. Friends and family may challenge us and pull us beyond our comfort zone, but you should feel relaxed enough that not rising to the challenge doesn’t threaten your sense of belonging.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text("You treat others with respect", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "If you’re respectful, it’s a sign that you probably have your social needs met and you aren't feeling threatened. You don’t have to bring others down to improve your self-esteem.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
];

//index == 3 Emotional Well Being
List<Widget> list3 = [
  Text("What is emotional well-being?", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "The National Center for Emotional Wellness (NCEW) describes emotional wellness or well-being as an awareness, understanding, and acceptance of feelings and an ability to manage effectively through times of change or challenge.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Uncomfortable or painful emotions and overwhelming thoughts can affect how well individuals function and may make people feel they are losing control of their lives.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text("Why is emotional well-being important?", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "According to the National Institutes of Health (NIH)Trusted Source, emotional well-being is important because it can affect how people function and carry out everyday tasks.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "It can also affect how well individuals are able to handle stressful situations and challenges, how they adapt to change, and how they respond to difficult life events.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Emotional well-being can affect relationships, work, and overall mental and physical health.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text("Factors that can influence emotional well-being may include:", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text(
    "challenges with work, school, relationships, or home life",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "changes in health",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "changes in relationships",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "retirement, which may affect social circles or sense of purpose",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "losing loved ones",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "moving away from family and friends",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
];







