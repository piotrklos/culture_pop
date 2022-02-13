import 'package:flutter/material.dart';

enum ViewState {
  loading,
  idle,
  error,
  init,
}

abstract class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.init;

  ViewState get viewState => _viewState;

  set viewState(ViewState state) {
    _viewState = state;
    notifyListeners();
  }
}
