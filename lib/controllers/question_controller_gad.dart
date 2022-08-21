import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/score/score_screen.dart';

import '../screens/score/score_screen2.dart';

// We use get package for our state management

class QuestionController2 extends GetxController {

  late PageController _pageController;
  PageController get pageController => this._pageController;
  //static get quizNum => null;

  List<Question> _questions = sample_data2.map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      ).toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    update();
    _pageController = PageController();
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _pageController.dispose();
  }

  int prevQuestionId = -1;

  void checkAns(Question question, int selectedIndex) {
    if(question.id == prevQuestionId){
      return;
    }
    // because once user press any option then it will run
    _isAnswered= true;

    _selectedAns=  selectedIndex;

    print('sel index = ${_selectedAns}');

    _numOfCorrectAns += _selectedAns;
    print('num correct ans = ${_numOfCorrectAns}');
    update();

    prevQuestionId = question.id;


    // Once user select an ans after 1s it will go to the next qn
    Future.delayed(Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.ease);
    } else {
      // Get package provides us simple way to navigate another page
      Get.to(ScoreScreen2());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
