import 'package:quizapp/src/core/model/category.dart';
import 'package:quizapp/src/core/model/question.dart';
import 'package:quizapp/src/core/service/app_service.dart';

class AppServiceImpl implements AppService {
  @override
  Future<List<QuestionModel>> getQuestions({
    required String categoryId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return [];
  }

  @override
  Future<List<CategoryModel>> getCagegories() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return [];
  }
}
