import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveScaffold extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final String? title;

  const AdaptiveScaffold({
    Key? key,
    required this.child,
    this.title,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: Material(
          child: SafeArea(
            child: child,
          ),
          color: backgroundColor ?? Theme.of(context).backgroundColor,
        ),
        backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        navigationBar: CupertinoNavigationBar(
          middle: _title,
        ),
      );
    } else {
      return Scaffold(
        body: child,
        backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: AppBar(
          title: _title,
        ),
      );
    }
  }

  Widget? get _title {
    if (title?.isEmpty ?? true) {
      return null;
    }
    return Text(title!);
  }
}
