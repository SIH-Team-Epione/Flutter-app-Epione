import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/controllers/question_controller_phq.dart';

import '../../../constants.dart';
import '../../../controllers/question_controller_gad.dart';

class Option2 extends StatelessWidget {
  const Option2({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController2>(
        init: QuestionController2(),
        builder: (qnController) {

          Color getTheRightColor(int idx) {
            if(qnController.isAnswered == true){
              if(qnController.selectedAns == idx) {
                return kGreenColor;
              }
            }
            return kGrayColor;
          }

          // IconData getTheRightIcon() {
          //   return getTheRightColor() == kRedColor ? Icons.done : Icons.done;
          // }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor(index)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1}. $text",
                    style: TextStyle(color: getTheRightColor(index), fontSize: 16),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: getTheRightColor(index) == kGrayColor
                          ? Colors.transparent
                          : getTheRightColor(index),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: getTheRightColor(index)),
                    ),
                    child: getTheRightColor(index) == kGrayColor
                        ? null
                        : Icon(Icons.done, size: 16),
                  )
                ],
              ),
            ),
          );
        });
  }
}
