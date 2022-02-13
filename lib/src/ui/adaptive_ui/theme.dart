import 'package:flutter/material.dart';

class AppTheme {
  static const Set<MaterialState> _interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  static ThemeData data({
    required Color primaryColor,
    // Color? hoverColor,
    Color? buttonHoverColor,
    Color? backgroundColor,
    Color? cardColor = Colors.white,
    Color? progressIndicator = Colors.white,
  }) {
    return ThemeData(
      backgroundColor: backgroundColor,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        primaryContainer: buttonHoverColor,
        background: backgroundColor ?? Colors.white, 
      ),
      cardColor: cardColor,
      primaryColor: primaryColor,
      // hoverColor: hoverColor,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: progressIndicator,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                24,
              ),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
          ),
          mouseCursor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return SystemMouseCursors.forbidden;
            }
            return SystemMouseCursors.click;
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.any(_interactiveStates.contains)) {
              return buttonHoverColor;
            }
            if (states.contains(MaterialState.disabled)) {
              return Colors.black.withOpacity(
                primaryColor.computeLuminance(),
              );
            }
            return primaryColor;
          }),
          minimumSize: MaterialStateProperty.resolveWith((states) {
            return const Size(44, 48);
          }),
          maximumSize: null,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                24,
              ),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
          ),
          mouseCursor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return SystemMouseCursors.forbidden;
            }
            return SystemMouseCursors.click;
          }),
          side: MaterialStateProperty.resolveWith((states) {
            var color = primaryColor;
            if (states.any(_interactiveStates.contains) &&
                buttonHoverColor != null) {
              color = buttonHoverColor;
            }
            return BorderSide(
              color: color,
            );
          }),
          textStyle: MaterialStateProperty.resolveWith((states) {
            var color = primaryColor;
            if (states.any(_interactiveStates.contains) &&
                buttonHoverColor != null) {
              color = buttonHoverColor;
            }
            return TextStyle(
              color: color,
            );
          }),
          minimumSize: MaterialStateProperty.resolveWith((states) {
            return const Size(44, 48);
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            var color = primaryColor;
            if (states.any(_interactiveStates.contains) &&
                buttonHoverColor != null) {
              color = buttonHoverColor;
            }
            return color;
          }),
          maximumSize: null,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                24,
              ),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
          ),
          mouseCursor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return SystemMouseCursors.forbidden;
            }
            return SystemMouseCursors.click;
          }),
          minimumSize: MaterialStateProperty.resolveWith((states) {
            return const Size(44, 48);
          }),
          maximumSize: null,
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            var color = primaryColor;
            if (states.any(_interactiveStates.contains) &&
                buttonHoverColor != null) {
              color = buttonHoverColor;
            }
            return color;
          }),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        hoverColor: buttonHoverColor,
      ),
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
    );
  }
}
