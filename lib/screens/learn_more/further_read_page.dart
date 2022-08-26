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
  Text("Why is Good Mental Health important for students?".toUpperCase(), style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text(
    "High levels of mental health can lead to a wide range of positive developments. These include –",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Increase in the capacity to learn",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Positive social behavior",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Increase in productivity",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Enhancement of creativity",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Development of better physical health",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Increase in life expectancy",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "An individual spends most of their youth in an educational institution. As such, the people they come across, the things they observe, and the behavior they feel can have an impact on their overall development.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "For instance, if a student obtaining high grades suddenly slips, there is a cause. Giving destructive criticism to make them feel guilty is a bad idea. Here, it is much more important to understand the student’s psyche and find the cause of the lack of concentration.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "In order to deal with this situation, students need to be aware that mental health is equally important. Making sure that your mind is in complete sync with your body is crucial. Moreover, if you feel any disturbance or emotional upheaval, share it with your parents and educators. There is no need to feel embarrassed or upset about it.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "It is important for students to share their dilemmas with someone who can guide them correctly. Here, a healthy student-teacher relationship also comes to play. If your teachers encourage you to share your issues with them, go ahead.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "The importance of mental health for students is simply undeniable. It is vital for increased creativity, learning, and developing positive relationships in society. With positive mental health, one can thrive in academics with ease. At Doaba School Parowal, the best school in Hoshiarpur, we focus on spreading mental health awareness among the students.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
];

//index == 2 early warning signs
List<Widget> list2 = [
  const SizedBox(height: 20.0),
  Text("Eating or sleeping too much or too little", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Pulling away from people and usual activities", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Feeling numb or like nothing matters.", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Having unexplained aches and pains.", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Feeling helpless or hopeless.", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Smoking, drinking, or using drugs more than usual", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Feeling unusually confused, forgetful, on edge, angry, upset, worried, or scared", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Yelling or fighting with family and friends", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Experiencing severe mood swings that cause problems in relationships", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Having persistent thoughts and memories you can't get out of your head", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Hearing voices or believing things that are not true.", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
];

//index == 3 myth vs fact
List<Widget> list3 = [
  const SizedBox(height: 30.0),
  Text(
    "Myth: If a person has a mental health condition, it means the person has low intelligence.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Fact: Mental illness, like physical illness, can affect anyone regardless of intelligence, social class, or income level.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text(
    "Myth: You only need to take care of your mental health if you have a mental health condition.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Fact: Everyone can benefit from taking active steps to promote their well-being and improve their mental health. Similarly, everyone can take active steps and engage in healthy habits to optimize their physical health.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text(
    "Myth: Poor mental health is not a big issue for teenagers. They just have mood swings caused by hormonal fluctuations and act out due to a desire for attention.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Teenagers often have mood swings, but that does not mean that adolescents may not also struggle with their mental health. Fourteen per cent of the world’s adolescents experience mental-health problems. Globally, among those aged 10–15, suicide is the fifth most prevalent cause of death, and for adolescents aged 15–19 it is the fourth most common cause. Half of all mental health conditions start by the age of 14.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text(
    "Myth: Nothing can be done to protect people from developing mental health conditions.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Fact: Many factors can protect people from developing mental health conditions, including strengthening social and emotional skills, seeking help and support early on, developing supportive, loving, warm family relationships, and having a positive school environment and healthy sleep patterns.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text(
    "Myth: A mental health condition is a sign of weakness; if the person were stronger, they would not have this condition.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Fact: A mental health condition has nothing to do with being weak or lacking willpower. It is not a condition people choose to have or not have. In fact, recognizing the need to accept help for a mental health condition requires great strength and courage. Anyone can develop a mental health condition.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
];

//index == 4 suicide prevention
List<Widget> list4 = [
  const SizedBox(height: 30.0),
  Text(
    "Effective, evidence-based interventions are available to help people who are at risk for suicide.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Safety Planning", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Personalized safety planning has been shown to help reduce suicidal thoughts and actions. Patients work with a caregiver to develop a plan that describes ways to limit access to lethal means such as firearms, pills, or poisons. The plan also lists coping strategies and people and resources that can help in a crisis.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Follow-up phone calls", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Research has shown that when at-risk patients receive further screening, a Safety Plan intervention, and a series of supportive phone calls, their risk of suicide goes down.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Cognitive Behavioral Therapy (CBT)", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Cognitive Behavioral Therapy (CBT) can help people learn new ways of dealing with stressful experiences. CBT helps individuals recognize their thought patterns and consider alternative actions when thoughts of suicide arise.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
];

//index == 5 types
List<Widget> list5 = [
  const SizedBox(height: 10.0),
  Text(
    "Classes of Mental Illness:",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text("Neurodevelopmental disorders".toUpperCase(), style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "This class covers a wide range of problems that usually begin in infancy or childhood, often before the child begins grade school. Examples include autism spectrum disorder, attention-deficit/hyperactivity disorder (ADHD) and learning disorders.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text("Bipolar and related disorders".toUpperCase(), style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "This class includes disorders with alternating episodes of mania — periods of excessive activity, energy and excitement — and depression.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text("Depressive disorders".toUpperCase(), style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "These include disorders that affect how you feel emotionally, such as the level of sadness and happiness, and they can disrupt your ability to function. Examples include major depressive disorder and premenstrual dysphoric disorder.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 30.0),
  Text("Anxiety disorders".toUpperCase(), style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Anxiety is an emotion characterized by the anticipation of future danger or misfortune, along with excessive worrying. It can include behavior aimed at avoiding situations that cause anxiety. This class includes generalized anxiety disorder, panic disorder and phobias.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
];

//index == 6 meditation
List<Widget> list6 = [
  const SizedBox(height: 10.0),
  Text(
    "Meditation can be defined as a set of techniques that are intended to encourage a heightened state of awareness and focused attention. Meditation is also a consciousness-changing technique that has been shown to have a wide number of benefits on psychological well-being.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Key things about meditation -", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Meditation has been practiced in cultures all over the world for thousands of years.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Nearly every religion, including Buddhism, Hinduism, Christianity, Judaism, and Islam, has a tradition of using meditative practices.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "While meditation is often used for religious purposes, many people practice it independently of any religious or spiritual beliefs or practices.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Meditation can also be used as a psychotherapeutic technique.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "There are many different types of meditation.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),

];

//index == 7 mindfulness
List<Widget> list7 = [
  Text(
    "Mindfulness involves focusing your awareness on the present moment. It means paying attention to your sensations, feelings, thoughts, and environment in the here-and-now with an attitude of acceptance. Some of the potential benefits of mindfulness include lowering stress, decreasing depression, improving memory, and strengthening your relationships, among other things.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Decreased Depression", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Reduced depression is one of the important benefits of mindfulness. It can help relieve symptoms of depression and may help prevent these symptoms from returning in the future.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Increased Emotional Regulation", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Another potential benefit of mindfulness is that the practice may help you identify and manage your feelings. Emotional regulation refers to your ability to exert control over your own emotions. This means being able to both enhance or reign in emotions depending on the situation and need.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Reduced Anxiety and Stress", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Chronic stress is a significant problem for many adults that can contribute to a variety of health problems, including an increased risk of depression and anxiety. According to the American Psychological Association, mindfulness can be helpful for soothing feelings of anxiety and stress.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
  const SizedBox(height: 20.0),
  Text("Better Memory", style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0
  ),),
  const SizedBox(height: 10.0),
  Text(
    "Mindfulness may also have potential as a way to boost your memory. If you’ve ever forgotten an important meeting or misplaced your car keys, then you know that even simple, everyday memory problems can be a major hassle. Many of these moments of forgetfulness are caused by something known as proactive interference, where older memories interfere with your ability to access newer ones.",
    textAlign: TextAlign.justify, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  ),),
];
