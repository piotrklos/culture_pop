import 'package:flutter/material.dart';
import 'package:quizapp/src/core/model/answer.dart';
import 'package:quizapp/src/core/model/question.dart';
import 'package:quizapp/src/ui/base/base_view_model.dart';

class QuestionPageViewModel extends BaseViewModel {
  final QuestionModel question;
  AnswerModel? _selectedAnswer;

  QuestionPageViewModel({
    required this.question,
  });

  void setAnswer(AnswerModel answer) {
    _selectedAnswer = answer;
    notifyListeners();
  }

  Color? answerColor(AnswerModel answer) {
    if (_selectedAnswer == null) {
      return null;
    }

    if (_selectedAnswer!.id == answer.id) {
      if (answer.id == question.correctAnswer) {
        return Colors.green;
      }
      return Colors.red;
    }

    if (answer.id == question.correctAnswer) {
      return Colors.green.withOpacity(0.4);
    }

    return null;
  }
}
