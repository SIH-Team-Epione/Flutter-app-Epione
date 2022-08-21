import 'package:flutter/material.dart';

import 'dart:ui' as ui;

import '../../util/network_image.dart';

class BenefitsPhysical extends StatelessWidget {
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
        RaisedButton(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
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
          SizedBox(height: 25,),
          Text(
            'BENEFITS',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          Text('\n'),
          Text(
            'Stefanie Gillett, Vista Charter Academy''s 14-year physical education instructor veteran has this to say...',
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
            'Gillett shares 10 benefits of physical activity:\n\n'+
            '\n1. Better focus in school. When the brain activates following exercise, it can better concentrate and helps improve memory and information retention. This helps students to perform better and learn more information during lessons.\n'
            +'\n2. Improves sleep quality. Students that participate in physical activity get better sleep and achieve a deeper sleep that helps their body to recover from exercise. Better sleep increases their ability to focus or concentrate their energy levels, and better manage stress.\n'
            +'\n3. Better academic performance. Studies show that students who are physically active get better grades. These students also perform better on standardized tests and have higher graduation rates.\n'
            +'\n4. Builds a strong, healthy body. Students that develop a routine for physical activity when they are younger lower their risk of obesity, heart disease, high blood pressure, and other life-altering diseases and conditions. This helps them build a healthier and stronger body for a longer life.\n'
            +'\n5. Reduces risk of anxiety and depression. Activity helps release endorphins, feel-good hormones, that help reduce stress therefore relieving feelings of anxiety and depression.\n'
            +'\n6. Develops better social and problem-solving skills. Participating in activities that include working with others on a team or a group help students develop positive social and problem-solving skills. Students learn to cooperate with others, encourage teammates, and achieve a goal. \n'
            +'\n7. Build self-confidence. Finding a skill, activity, or sport a student can find success at helps build self-confidence which helps students try new skills, learn new information, and take risks.\n'
            +'\n8. More energy. A body in motion, stays in motion. When a student participates in regular physical activity, they will have more energy and be alert throughout their day. This helps them engage in their learning and enjoy class.\n'
            +'\n9. It''s fun. It''s important for all students to just have fun! Finding an activity a student enjoys and finds pleasure in will help increase the likelihood of them participating in physical activity for their lifetime.\n',
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
              'https://images.unsplash.com/photo-1617209398963-7533436eaae2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80',
              fit: BoxFit.cover),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: _buildContent(context),
            ),
          ),
        ],
      ),
    );
  }
}
