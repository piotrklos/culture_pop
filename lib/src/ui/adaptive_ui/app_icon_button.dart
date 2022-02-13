import 'package:flutter/material.dart';
import 'package:quizapp/src/ui/adaptive_ui/button_style.dart';
import 'package:quizapp/src/ui/adaptive_ui/theme.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData iconData;
  final AppButtonStyle style;
  final double size;

  const AppIconButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
    this.style = AppButtonStyle.main,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.data(
        buttonHoverColor: style.hoverColor(context),
        primaryColor: style.primaryColor(context),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          size: size,
        ),
        iconSize: size,
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minHeight: 10,
          minWidth: 10,
          maxHeight: size,
        ),
        splashRadius: size,
        splashColor: style.hoverColor(context),
      ),
    );
  }
}
