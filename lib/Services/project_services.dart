import 'package:flutter/cupertino.dart';
import 'package:portfolio_site/components/project_grid.dart';

class PageViewDotsState extends ChangeNotifier {
  int activePage;
  PageViewDotsState() : activePage = 0;

  void changePage(int index) {
    activePage = index;
    notifyListeners();
  }
}


