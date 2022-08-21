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

//index == 1 means relevance for students
List<Widget> list1 = [
  const SizedBox(height: 30.0),
  Text("Why is it important for students?".toUpperCase(), style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "There has been researches that show the positive correlation between being physically active and improving as a student. Being a young student means you have a lot of potentials to be able to develop new hobbies that can benefit your fitness. It can be anything like running, skipping, or doing yoga. Exercising at least four times a week increases your metabolic rate which reduces the risk of cardiovascular diseases in the future which is just one of the numerous benefits.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Being physically fit doesn’t require you have a strict schedule, but just have enough discipline to repeat it regularly. This aspect of self-care directly impacts all others and hence we encourage evryone user to actively utilize the features within this track!",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Having an enthusiastic and active lifestyle overhauls your personality. It lets you perform physical activities without being tired or restless. It also ensures that you are mentally fit and stress-free. So here is your cue to embark on your fitness journey while starting your journey with Epione",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
];

//index == 2 early warning signs
List<Widget> list2 = [
  const SizedBox(height: 30.0),
  Text("Why is it important for students?".toUpperCase(), style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "There has been researches that show the positive correlation between being physically active and improving as a student. Being a young student means you have a lot of potentials to be able to develop new hobbies that can benefit your fitness. It can be anything like running, skipping, or doing yoga. Exercising at least four times a week increases your metabolic rate which reduces the risk of cardiovascular diseases in the future which is just one of the numerous benefits.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Being physically fit doesn’t require you have a strict schedule, but just have enough discipline to repeat it regularly. This aspect of self-care directly impacts all others and hence we encourage evryone user to actively utilize the features within this track!",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Having an enthusiastic and active lifestyle overhauls your personality. It lets you perform physical activities without being tired or restless. It also ensures that you are mentally fit and stress-free. So here is your cue to embark on your fitness journey while starting your journey with Epione",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
];

//index == 3 myth vs fact
List<Widget> list3 = [
  const SizedBox(height: 30.0),
  Text("Why is it important for students?".toUpperCase(), style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "There has been researches that show the positive correlation between being physically active and improving as a student. Being a young student means you have a lot of potentials to be able to develop new hobbies that can benefit your fitness. It can be anything like running, skipping, or doing yoga. Exercising at least four times a week increases your metabolic rate which reduces the risk of cardiovascular diseases in the future which is just one of the numerous benefits.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Being physically fit doesn’t require you have a strict schedule, but just have enough discipline to repeat it regularly. This aspect of self-care directly impacts all others and hence we encourage evryone user to actively utilize the features within this track!",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Having an enthusiastic and active lifestyle overhauls your personality. It lets you perform physical activities without being tired or restless. It also ensures that you are mentally fit and stress-free. So here is your cue to embark on your fitness journey while starting your journey with Epione",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
];







