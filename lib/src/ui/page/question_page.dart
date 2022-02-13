import 'package:flutter/material.dart';
import 'package:quizapp/src/core/model/answer.dart';
import 'package:quizapp/src/core/model/question.dart';
import 'package:quizapp/src/ui/adaptive_ui/scaffold.dart';
import 'package:quizapp/src/ui/page/question_page_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../core/localizations/generated/l10n.dart';

class QuestionPage extends StatelessWidget {
  final QuestionModel question;

  const QuestionPage({
    required this.question,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuestionPageViewModel>.reactive(
      viewModelBuilder: () => QuestionPageViewModel(
        question: question,
      ),
      builder: (ctx, model, _) {
        return AdaptiveScaffold(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _question(model),
                  const Spacer(),
                  ..._answers(
                    context: context,
                    model: model,
                  ),
                ],
              ),
            ),
          ),
          title: AppLocalizations.current.appName,
        );
      },
    );
  }

  Widget _question(QuestionPageViewModel model) {
    return Container(
      child: Text(
        model.question.question,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  List<Widget> _answers({
    required QuestionPageViewModel model,
    required BuildContext context,
  }) {
    return model.question.answers.map((e) {
      return _answer(
        answer: e,
        context: context,
        model: model,
      );
    }).toList();
  }

  Widget _answer({
    required BuildContext context,
    required AnswerModel answer,
    required QuestionPageViewModel model,
  }) {
    return GestureDetector(
      onTap: () {
        model.setAnswer(answer);
        _onTap(context: context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(8),
          color: model.answerColor(answer),
        ),
        child: Text(
          answer.answer,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  void _onTap({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16,
                ),
                color: Colors.white,
              ),
              height: 100,
            ),
          ),
        );
      },
    );
  }
}
