import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveApp extends StatelessWidget {
  final String initialRoute;
  const AdaptiveApp({
    Key? key,
    required this.initialRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        initialRoute: initialRoute,
      );
    }
    return MaterialApp(
      initialRoute: initialRoute,
    );
  }
}
