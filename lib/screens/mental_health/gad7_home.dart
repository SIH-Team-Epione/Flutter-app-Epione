import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:quiz_app/screens/quiz/quiz_screen2.dart';

class GADScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 2), //2/6
                  Center(
                    child: Text(
                      "Generalized Anxiety Disorder Questionnaire",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text("The Generalized Anxiety Disorder Scale-7 (GAD-7) is a 7-item, self-rated scale developed by Spitzer and colleagues (2006) as a screening tool and severity indicator for GAD. It is easily scored and initially was created to increase recognition of GAD in primary care settings. The original validation of the GAD-7 in a large primary care sample revealed that the measure has good reliability, and good criterion, factorial, and procedural validity. This analysis will help us guide you further. Please answer over the last 2 weeks, how often have you been bothered by the following problems?"),
                  Spacer(), // 1/6
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () => Get.to(QuizScreen2()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Start Quiz",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
