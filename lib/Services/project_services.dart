import 'package:flutter/material.dart';
import 'package:portfolio_site/components/project_views.dart';

class Project {
  final String name;
  final String description;
  // final List<Photo> photos;
  final String photoLocation;
  final String tools;
  final String takeAways;
  final String url;

  Project(
      {required this.name,
      required this.description,
      required this.photoLocation,
      required this.tools,
      required this.takeAways,
      required this.url});
}

List<Project> projects = [
  Project(name: 'Productivity App', description: 'description', photoLocation: 'projects/productivity_app', tools: 'Flutter Firebase Firestore FireAuth Provider', takeAways: 'takeAways', url: 'https://github.com/Z-inator/productivity_app'),
  Project(name: 'Star Citizen App', description: 'description', photoLocation: 'projects/star_citizen_app', tools: 'Flutter Firebase Firestore FireAuth Provider', takeAways: 'takeAways', url: 'https://github.com/Z-inator/star_citizen_app'),
  Project(name: 'Simple Time Range Picker', description: 'description', photoLocation: 'projects/simple_time_range_picker', tools: 'Flutter PubDev-package', takeAways: 'takeAways', url: 'https://github.com/trashfeed/simple_time_range_picker'),
  Project(name: 'Dynamic Color Theme', description: 'description', photoLocation: 'projects/dynamic_color_theme', tools: 'Flutter PubDev-package', takeAways: 'takeAways', url: 'https://github.com/DFreds/dynamic_color_theme'),
  Project(name: 'Django Management App', description: 'description', photoLocation: 'projects/django_management_app', tools: 'Django SQL Authentification Admin Django-Signals, ', takeAways: 'takeAways', url: 'https://github.com/Z-inator/DjangoManagementAppClone'),
  Project(name: 'Django Social Media App', description: 'description', photoLocation: 'projects/django_social_media_app', tools: 'Django SQL Authentification', takeAways: 'takeAways', url: 'https://github.com/Z-inator/DjangoSocialMediaClone'),
];

class PageViewDotsState extends ChangeNotifier {
  int activePage;
  PageViewDotsState() : activePage = 0;

  void changePage(int index) {
    activePage = index;
    notifyListeners();
  }
}


