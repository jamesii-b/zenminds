import 'package:flutter/material.dart';

class SelectionIndex extends ChangeNotifier {
  int _selectionIndex = 0;
  int get selection => _selectionIndex;
  void updateSelection(value) {
    _selectionIndex = value;
    notifyListeners();
  }
}
