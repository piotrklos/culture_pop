import 'package:quizapp/src/core/model/category.dart';
import 'package:quizapp/src/core/model/question.dart';
import 'package:quizapp/src/core/service/app_service.dart';
import 'package:quizapp/src/ui/base/base_view_model.dart';

class CategoryInfoPageViewModel extends BaseViewModel {
  final AppService appService;
  final CategoryModel category;

  List<QuestionModel> _questionsList = [];
  List<QuestionModel> get questionsList => _questionsList;

  CategoryInfoPageViewModel({
    required this.appService,
    required this.category,
  });

  void init() {
    viewState = ViewState.loading;
    _downloadQuestions();
  }

  Future<void> _downloadQuestions() async {
    try {
      _questionsList = await appService.getQuestions(
        categoryId: category.id,
      );
      viewState = ViewState.idle;
    } catch (_) {
      _questionsList = [];
      viewState = ViewState.error;
    }
  }
}
