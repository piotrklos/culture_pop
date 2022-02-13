import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quizapp/src/core/model/answer.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class QuestionModel with _$QuestionModel {
  factory QuestionModel({
    required String id,
    required List<String> categories,
    required String question,
    required String correctAnswer,
    required List<AnswerModel> answers,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
