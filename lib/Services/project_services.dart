import 'package:flutter/material.dart';
import 'package:portfolio_site/components/project_views.dart';

class PageViewDotsState extends ChangeNotifier {
  int activePage;
  PageViewDotsState() : 
    activePage = 0;
    

  void changePage(int index) {
    activePage = index;
    notifyListeners();
  }
}

class ProjectState {
  List<Project> projects;
  ProjectState()
      : projects = List.generate(
            5,
            (index) => Project(
                'name$index',
                'description',
                Image(
                  image: AssetImage('dashboard.png'),
                ),
                'tools',
                'takeAways'));

  void dispose() {}
}
