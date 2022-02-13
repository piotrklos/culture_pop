import 'package:flutter/material.dart';
import 'package:quizapp/src/core/model/answer.dart';
import 'package:quizapp/src/core/model/category.dart';
import 'package:quizapp/src/core/model/question.dart';
import 'package:quizapp/src/core/service/app_service.dart';

class MockAppServiceImpl implements AppService {
  @override
  Future<List<QuestionModel>> getQuestions({
    required String categoryId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return [
      QuestionModel(
        categories: [
          "fds",
        ],
        id: "",
        question: "Czy to jest jakieś przykałdoawe pytanie?",
        correctAnswer: "1",
        answers: [
          AnswerModel(
            answer: "Opowiedź A",
            id: "1",
          ),
          AnswerModel(
            answer: "Opowiedź B",
            id: "2",
          ),
          AnswerModel(
            answer: "Opowiedź C",
            id: "3",
          ),
          AnswerModel(
            answer: "Opowiedź D",
            id: "4",
          ),
        ],
      ),
    ];
  }

  @override
  Future<List<CategoryModel>> getCagegories() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return [
      CategoryModel(
        descritpion: "",
        id: "",
        imageUrl:
            "https://unsplash.com/photos/c0VRNWVEjOA/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTN8fHN0YXIlMjB3YXJzfGVufDB8fHx8MTY0NDY4NjA4MQ&force=true&w=640",
        title: "Star Wars",
        type: "",
        color: Colors.yellow,
      ),
      CategoryModel(
        descritpion: "",
        id: "",
        imageUrl:
            "https://unsplash.com/photos/3n7DdlkMfEg/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8Mnx8aGFycnklMjBwb3R0ZXJ8ZW58MHx8fHwxNjQ0NjUwODM0&force=true&w=640",
        title: "Harry Potter",
        type: "",
        color: Colors.green,
      ),
    ];
  }
}
