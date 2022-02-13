import 'package:flutter/material.dart';
import 'package:quizapp/src/ui/adaptive_ui/button_style.dart';
import 'package:quizapp/src/ui/adaptive_ui/theme.dart';

enum _AppButtonStyle {
  text,
  filled,
  outlined,
}

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final _AppButtonStyle _style;
  final AppButtonStyle style;
  final bool showLoading;

  const AppButton.text({
    Key? key,
    required this.label,
    required this.onPressed,
    this.showLoading = false,
    this.style = AppButtonStyle.main,
  })  : _style = _AppButtonStyle.text,
        super(key: key);

  const AppButton.filled({
    Key? key,
    required this.label,
    required this.onPressed,
    this.showLoading = false,
    this.style = AppButtonStyle.main,
  })  : _style = _AppButtonStyle.filled,
        super(key: key);

  const AppButton.outlined({
    Key? key,
    required this.label,
    required this.onPressed,
    this.showLoading = false,
    this.style = AppButtonStyle.main,
  })  : _style = _AppButtonStyle.outlined,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.data(
        buttonHoverColor: style.hoverColor(context),
        primaryColor: style.primaryColor(context),
        progressIndicator: _progressIndicator(context),
      ),
      child: Builder(
        builder: (ctx) {
          return _button(ctx);
        },
      ),
    );
  }

  Color? _progressIndicator(BuildContext context) {
    if (_style == _AppButtonStyle.filled) {
       return Theme.of(context).primaryTextTheme.button?.color;
    }
    return style.primaryColor(context);
  }

  Widget _button(BuildContext context) {
    switch (_style) {
      case _AppButtonStyle.text:
        return TextButton(
          child: _childAnimation(context),
          onPressed: onPressed,
        );
      case _AppButtonStyle.filled:
        return ElevatedButton(
          child: _childAnimation(context),
          onPressed: onPressed,
        );
      case _AppButtonStyle.outlined:
        return OutlinedButton(
          child: _childAnimation(context),
          onPressed: onPressed,
        );
    }
  }

  Widget _childAnimation(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 100),
      child: _child(),
    );
  }

  Widget _child() {
    if (showLoading) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(),
      );
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      child: Text(
        label,
      ),
    );
  }
}
