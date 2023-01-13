import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../../util/network_image.dart';

class CommunicationSkillsScreen extends StatelessWidget {
  static final String path = "lib/screens/learn_more/benefits_physical.dart";

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildInfo(),
          _buildbuton(context),
        ],
      ),
    );
  }

  Widget _buildbuton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Text(
            'Back',
            style: TextStyle(color: Colors.white70),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Text(
            'Developing communication skills',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          Text('\n'),
          Text(
            'In order to improve your social health, developing your communication skills can be immensely beenficial, especially for students. Here, we highlight how you can work on developing these indispensable skills.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.85),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            width: 225.0,
            height: 1.0,
          ),
          Text(
            'Enhance your communication:\n\n' +
                '\n1. Practice active listening\n\n The goal of active listening is to ensure that you hear not just the words the person is saying, but the entire message. Some tips for active listening include: Giving the speaker your full and undivided attention, Showing open, positive body language to keep your mind focused and to show the speaker that you are really listening, Clearing your mind of distractions, judgements, and counter-arguments. Active listening also means listening to understand rather than reply. Reinforce building good listening skills by encouraging yourself to practice asking clarifying questions to fully understand the speaker’s intended message.\n' +
                '\n2. Build your emotional intelligence. \n\nCommunication is built upon a foundation of emotional intelligence. Simply put, you cannot communicate effectively with others until you can assess and understand your own feelings. Understanding and managing your own emotions is only part of emotional intelligence. The other part—equally important for effective communication—is empathy for others.\n' +
                '\n3. Ask open-ended question.\n' +
                '\n5. Reduces risk of anxiety and depression. Activity helps release endorphins, feel-good hormones, that help reduce stress therefore relieving feelings of anxiety and depression.\n' +
                '\n6. Quality of Being Friendly to Others.\n\n Good communication skills build strong friendships. It also helps in making us confident enough. Better verbal Communication and physical expressions help them to make new friends. Studying with good friends in school reduces stress & enables you to learn much better. \n' +
                '\n7. Respect Opinions of Other.\n\n Always respect others & give regards to what they’re saying or what they have to say. Respecting others while acknowledging them, is an important aspect of Communication. Being respectful is just like paying attention to what other is saying, by this, the other one feels greatly appreciated, which leads to a better, honest as well as effective communication.\n',
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 50.0,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          PNetworkImage(
              'https://childsuccesscenter.com/wp-content/uploads/2019/05/student-giving-a-speech-1024x683.jpg',
              fit: BoxFit.cover),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.68),
              child: _buildContent(context),
            ),
          ),
        ],
      ),
    );
  }
}
