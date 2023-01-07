import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller_gad.dart';
import 'package:quiz_app/controllers/question_controller_phq.dart';
import 'components/body.dart';
import 'components/body2.dart';

class QuizScreen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    QuestionController2 _controller = Get.put(QuestionController2());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Flutter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0
            ),
          onPressed: _controller.nextQuestion,
          child: Text("Next"),
          ),
        ],
      ),
      body: Body2(),
    );
  }
}
