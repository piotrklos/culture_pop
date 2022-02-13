import 'package:flutter/material.dart';
import 'package:quizapp/src/core/localizations/generated/l10n.dart';
import 'package:quizapp/src/ui/adaptive_ui/app_button.dart';
import 'package:quizapp/src/ui/adaptive_ui/button_style.dart';
import 'package:quizapp/src/ui/adaptive_ui/scaffold.dart';
import 'package:quizapp/src/ui/page/category_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context).appName,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            AppButton.filled(
              label: AppLocalizations.of(context).start,
              style: AppButtonStyle.main,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return const CategoryListPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
