import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/src/core/localizations/generated/l10n.dart';
import 'package:quizapp/src/ui/adaptive_ui/scaffold.dart';
import 'package:quizapp/src/ui/base/base_view_model.dart';
import 'package:quizapp/src/ui/base/category_widget.dart';
import 'package:quizapp/src/ui/page/category_info.dart';
import 'package:quizapp/src/ui/page/category_page_view_model.dart';
import 'package:stacked/stacked.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryPageViewModel>.reactive(
      viewModelBuilder: () => CategoryPageViewModel(
        appService: Provider.of(context),
      ),
      onModelReady: (model) => model.init(),
      builder: (ctx, model, _) {
        return AdaptiveScaffold(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: _content(model: model, context: context),
          ),
          title: AppLocalizations.of(context).categoriesList,
        );
      },
    );
  }

  Widget _content({
    required CategoryPageViewModel model,
    required BuildContext context,
  }) {
    switch (model.viewState) {
      case ViewState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ViewState.idle:
        return _categoriesList(context: context, model: model);
      case ViewState.error:
        // TODO: Handle this case.
        return Container();
      case ViewState.init:
        return Container();
    }
  }

  Widget _categoriesList({
    required CategoryPageViewModel model,
    required BuildContext context,
  }) {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        return CategoryWidget(
          category: model.categoryList[index],
          onTap: (category) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  return CategoryInfoPage(
                    category: category,
                  );
                },
              ),
            );
          },
        );
      },
      itemCount: model.categoryList.length,
      separatorBuilder: (ctx, _) {
        return const SizedBox(
          height: 16,
        );
      },
    );
  }
}
