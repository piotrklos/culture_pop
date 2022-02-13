import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/src/core/localizations/generated/l10n.dart';
import 'package:quizapp/src/core/model/category.dart';
import 'package:quizapp/src/ui/adaptive_ui/app_button.dart';
import 'package:quizapp/src/ui/adaptive_ui/scaffold.dart';
import 'package:quizapp/src/ui/base/base_view_model.dart';
import 'package:quizapp/src/ui/page/category_info_view_model.dart';
import 'package:quizapp/src/ui/page/question_page.dart';
import 'package:stacked/stacked.dart';

class CategoryInfoPage extends StatelessWidget {
  final CategoryModel category;

  const CategoryInfoPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryInfoPageViewModel>.reactive(
      viewModelBuilder: () => CategoryInfoPageViewModel(
        category: category,
        appService: Provider.of(context),
      ),
      onModelReady: (model) => model.init(),
      builder: (ctx, model, _) {
        return AdaptiveScaffold(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: _content(model: model, context: context),
          ),
          title: category.title,
        );
      },
    );
  }

  Widget _content({
    required CategoryInfoPageViewModel model,
    required BuildContext context,
  }) {
    switch (model.viewState) {
      case ViewState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ViewState.idle:
        return _categoryInfo(context: context, model: model);
      case ViewState.error:
        // TODO: Handle this case.
        return Container();
      case ViewState.init:
        return Container();
    }
  }

  Widget _categoryInfo({
    required BuildContext context,
    required CategoryInfoPageViewModel model,
  }) {
    return Center(
      child: AppButton.filled(
        label: AppLocalizations.of(context).start,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) {
                return QuestionPage(
                  question: model.questionsList.first,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
