import 'package:quizapp/src/core/model/category.dart';
import 'package:quizapp/src/core/service/app_service.dart';
import 'package:quizapp/src/ui/base/base_view_model.dart';

class CategoryPageViewModel extends BaseViewModel {
  final AppService appService;
  List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;

  CategoryPageViewModel({
    required this.appService,
  });

  void init() {
    viewState = ViewState.loading;
    _downloadCategories();
  }

  Future<void> _downloadCategories() async {
    try {
      _categoryList = await appService.getCagegories();
      viewState = ViewState.idle;
    } catch (_) {
      _categoryList = [];
      viewState = ViewState.error;
    }
  }
}
