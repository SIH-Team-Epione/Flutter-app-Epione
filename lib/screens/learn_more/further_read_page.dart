import 'package:flutter/material.dart';
import 'package:quiz_app/models/further_mental_list.dart';

class FurtherReadScreen extends StatefulWidget {

  const FurtherReadScreen({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<FurtherReadScreen> createState() => _FurtherReadScreenState();
}

class _FurtherReadScreenState extends State<FurtherReadScreen> {

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
                          else if(widget.index == 4)...list4
                            else if(widget.index == 5)...list5
                              else if(widget.index == 6)...list6
                                else if(widget.index == 7)...list7
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

//index == 0 means diagnosis and treatment
List<Widget> list0 = [
  const SizedBox(height: 30.0),
  Text("Diagnosis".toUpperCase(), style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "To determine a diagnosis and check for related complications, you may have:\n\nA physical exam: Your doctor will try to rule out physical problems that could cause your symptoms.\n\nLab tests: These may include, for example, a check of your thyroid function or a screening for alcohol and drugs.\n\nA psychological evaluation: A doctor or mental health professional talks to you about your symptoms, thoughts, feelings and behavior patterns. You may be asked to fill out a questionnaire to help answer these questions.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text("Treatment".toUpperCase(), style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Your treatment depends on the type of mental illness you have, its severity and what works best for you. In many cases, a combination of treatments works best. If you have a mild mental illness with well-controlled symptoms, treatment from your primary care provider may be sufficient. However, often a team approach is appropriate to make sure all your psychiatric, medical and social needs are met. This is especially important for severe mental illnesses, such as schizophrenia.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
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

//index == 4 suicide prevention
List<Widget> list4 = [
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

//index == 5 types
List<Widget> list5 = [
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

//index == 6 meditation
List<Widget> list6 = [
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

//index == 7 mindfulness
List<Widget> list7 = [
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
