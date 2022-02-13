import 'package:flutter/material.dart';

enum AppButtonStyle {
  main,
  yellow,
  gray,
}

extension AppButtonStyleExtension on AppButtonStyle {
  Color primaryColor(BuildContext context) {
    switch (this) {
      case AppButtonStyle.main:
        return Theme.of(context).colorScheme.primary;
      case AppButtonStyle.yellow:
        return Colors.yellow;
      case AppButtonStyle.gray:
        return Colors.grey;
    }
  }

  Color hoverColor(BuildContext context) {
    switch (this) {
      case AppButtonStyle.main:
        return Theme.of(context).colorScheme.primaryContainer;
      case AppButtonStyle.yellow:
        return Colors.amber;
      case AppButtonStyle.gray:
        return Colors.grey.shade300;
    }
  }
}
