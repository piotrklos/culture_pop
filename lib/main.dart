import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/src/core/localizations/generated/l10n.dart';
import 'package:quizapp/src/core/service/app_service.dart';
import 'package:quizapp/src/core/service/impl/mock_app_service_impl.dart';
import 'package:quizapp/src/ui/adaptive_ui/theme.dart';
import 'package:quizapp/src/ui/page/home_page.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppService>(create: (_) => MockAppServiceImpl()),
      ],
      child: Builder(
        builder: (ctx) {
          return MaterialApp(
            title: AppLocalizations.of(context).appName,
            theme: AppTheme.data(
              primaryColor: Colors.blue,
              backgroundColor: Colors.black,
            ),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.delegate.supportedLocales,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
