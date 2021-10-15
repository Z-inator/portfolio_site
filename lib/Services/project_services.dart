import 'package:flutter/material.dart';

class PageViewDotsState extends ChangeNotifier {
  int activePage;
  PageViewDotsState() : activePage = 0;

  void changePage(int index) {
    activePage = index;
    notifyListeners();
  }
}
