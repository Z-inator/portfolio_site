import 'package:flutter/material.dart';
import 'package:portfolio_site/components/project_views.dart';

class Project {
  final String name;
  final String description;
  // final List<Photo> photos;
  final String photoLocation;
  final List<String> tools;
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
  Project(
      name: 'Productivity App',
      description: 'description',
      photoLocation: 'projects/productivity_app',
      tools: ['Flutter', 'Firebase', 'Firestore', 'FireAuth', 'Prov[ider'],
      takeAways: 'takeAways',
      url: 'https://github.com/Z-inator/productivity_app'),
  Project(
      name: 'Star Citizen App',
      description: 'description',
      photoLocation: 'projects/star_citizen_app',
      tools: ['Flutter', 'Firebase', 'Firestore', 'FireAuth', 'Provider'],
      takeAways: 'takeAways',
      url: 'https://github.com/Z-inator/star_citizen_app'),
  Project(
      name: 'Simple Time Range Picker',
      description: 'description',
      photoLocation: 'projects/simple_time_range_picker',
      tools: ['Flutter', 'PubDev Package'],
      takeAways: 'takeAways',
      url: 'https://github.com/trashfeed/simple_time_range_picker'),
  Project(
      name: 'Dynamic Color Theme',
      description: 'description',
      photoLocation: 'projects/dynamic_color_theme',
      tools: ['Flutter', 'PubDev Package'],
      takeAways: 'takeAways',
      url: 'https://github.com/DFreds/dynamic_color_theme'),
  Project(
      name: 'Django Management App',
      description: 'description',
      photoLocation: 'projects/django_management_app',
      tools: ['Django', 'SQL', 'Authentification', 'Admin', 'Django Signals'],
      takeAways: 'takeAways',
      url: 'https://github.com/Z-inator/DjangoManagementAppClone'),
  Project(
      name: 'Django Social Media App',
      description: 'description',
      photoLocation: 'projects/django_social_media_app',
      tools: ['Django', 'SQL', 'Authentification'],
      takeAways: 'takeAways',
      url: 'https://github.com/Z-inator/DjangoSocialMediaClone'),
  Project(
      name: 'Ravenous App',
      description: 'description',
      photoLocation: 'projects/ravenous_app',
      tools: ['React', 'Yelp API', 'AJAX'],
      takeAways: 'takeAways',
      url:
          'https://github.com/Z-inator/Web-Development/tree/master/Ravenous%20App'),
  Project(
      name: 'Jamming App',
      description: 'description',
      photoLocation: 'projects/jamming_app',
      tools: ['React', 'Spotify API'],
      takeAways: 'takeAways',
      url:
          'https://github.com/Z-inator/Web-Development/tree/master/Jamming%20App'),
  Project(
      name: 'Codecademy Computer Science Program',
      description: 'description',
      photoLocation: '',
      tools: [
        'Nodes',
        'Queues',
        'Stacks',
        'Hash Maps',
        'Recursion',
        'Trees',
        'Graphs',
        'Databases',
        'Computer Architecture'
      ],
      takeAways: 'takeAways',
      url: 'https://github.com/Z-inator/Computer-Science-Course')
];

class PageViewDotsState extends ChangeNotifier {
  int activePage;
  PageViewDotsState() : activePage = 0;

  void changePage(int index) {
    activePage = index;
    notifyListeners();
  }
}
