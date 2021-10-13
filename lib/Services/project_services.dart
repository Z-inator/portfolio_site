import 'package:flutter/material.dart';
import 'package:portfolio_site/components/project_views.dart';

class Project {
  final String name;
  final String description;
  final String framework;
  // final List<Photo> photos;
  final String photoLocation;
  final List<String> tools;
  final String features;
  final String url;

  Project({
      required this.framework, 
      required this.name,
      required this.description,
      required this.photoLocation,
      required this.tools,
      required this.features,
      required this.url});
}

List<Project> projects = [
  Project(
      name: 'Productivity App',
      description: 'This app is both a dream app and capstone project. I like to track my productivity in all the different projects I do but was struggling to find an app that was a task manager, project manager, time logger and timer, and goal planner. So I made the app that I want to use. This app allows the user to create an account and track progress of tasks. They can assign time entries to tasks and projects or run a live timer for it. ',
      framework: 'Flutter',
      photoLocation: 'projects/productivity_app',
      tools: ['Flutter', 'Firebase', 'Firestore', 'FireAuth', 'Provider'],
      features: 'features',
      url: 'https://github.com/Z-inator/productivity_app'),
  Project(
      name: 'Star Citizen App',
      description: 'description',
      framework: 'Flutter',
      photoLocation: 'projects/star_citizen_app',
      tools: ['Flutter', 'Firebase', 'Firestore', 'FireAuth', 'Provider'],
      features: 'features',
      url: 'https://github.com/Z-inator/star_citizen_app'),
  Project(
      name: 'Simple Time Range Picker',
      description: 'description',
      framework: 'Flutter',
      photoLocation: 'projects/simple_time_range_picker',
      tools: ['Flutter', 'PubDev Package'],
      features: 'features',
      url: 'https://github.com/trashfeed/simple_time_range_picker'),
  Project(
      name: 'Dynamic Color Theme',
      description: 'description',
      framework: 'Flutter',
      photoLocation: 'projects/dynamic_color_theme',
      tools: ['Flutter', 'PubDev Package'],
      features: 'features',
      url: 'https://github.com/DFreds/dynamic_color_theme'),
  Project(
      name: 'Management App',
      description: 'description',
      framework: 'Django',
      photoLocation: 'projects/django_management_app',
      tools: ['Django', 'SQL', 'Authentification', 'Admin', 'Django Signals'],
      features: 'features',
      url: 'https://github.com/Z-inator/DjangoManagementAppClone'),
  Project(
      name: 'Social Media App',
      description: 'description',
      framework: 'Django',
      photoLocation: 'projects/django_socialmedia_app',
      tools: ['Django', 'SQL', 'Authentification'],
      features: 'features',
      url: 'https://github.com/Z-inator/DjangoSocialMediaClone'),
  Project(
      name: 'Ravenous App',
      description: 'description',
      framework: 'React',
      photoLocation: 'projects/ravenous_app',
      tools: ['React', 'Yelp API', 'AJAX'],
      features: 'features',
      url:
          'https://github.com/Z-inator/Web-Development/tree/master/Ravenous%20App'),
  Project(
      name: 'Jamming App',
      description: 'description',
      framework: 'React',
      photoLocation: 'projects/jamming_app',
      tools: ['React', 'Spotify API'],
      features: 'features',
      url:
          'https://github.com/Z-inator/Web-Development/tree/master/Jamming%20App'),
  Project(
      name: 'Codecademy Computer Science Program',
      description: 'description',
      framework: 'Python',
      photoLocation: 'projects/computer_science_program',
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
      features: 'features',
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
