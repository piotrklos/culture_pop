import 'package:quizapp/src/core/model/category.dart';
import 'package:quizapp/src/core/model/question.dart';

abstract class AppService {
  Future<List<QuestionModel>> getQuestions({
    required String categoryId,
  });
  
  Future<List<CategoryModel>> getCagegories();
}
