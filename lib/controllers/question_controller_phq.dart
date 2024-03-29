import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/score/score_screen.dart';

// We use get package for our state management
class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // Lets animated our progress bar

  late AnimationController _animationController;
  late Animation _animation;

  // so that we can access our animation outside
  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;
  //static get quizNum => null;

  List<Question> _questions =  sample_data.map(
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
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  int prevQuestionId = -1;

  void checkAns(Question question, int selectedIndex) {
    if(question.id == prevQuestionId){
      return;
    }
    // because once user press any option then it will run
    _isAnswered = true;
    //_correctAns = question.answer;
    _selectedAns = selectedIndex;
    //print('correct ans = ${question.answer}');
    print('sel index = $_selectedAns');

    _numOfCorrectAns += _selectedAns;
    print('num correct ans = ${_numOfCorrectAns}');

    // It will stop the counter
    _animationController.stop();
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

      // Reset the counter
      _animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provides us simple way to navigate another page
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
