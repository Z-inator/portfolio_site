import 'dart:developer';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/Services/project_services.dart';
import 'package:portfolio_site/screens/main_body_content.dart';
import 'package:provider/provider.dart';

class ProjectPageView extends StatelessWidget {
  late PageController pageController = PageController();
  late List<Project> projects;
  ProjectPageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Project> projects = Provider.of<ProjectState>(context).projects;
    PageViewDotsState pageViewDotsState = Provider.of<PageViewDotsState>(context);
    return Container(
      height: 500,
      child: Stack(children: [
        PageView.builder(
            itemCount: projects.length,
            controller: pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (int) => pageViewDotsState.changePage(int),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: ProjectTile(project: projects[index]));
            }),
        Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
                onPressed: () {
                  pageController.animateToPage(
                      (pageController.page! - 1).toInt(),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                icon: Icon(Icons.chevron_left_rounded)),
            IconButton(
                onPressed: () {
                  pageController.animateToPage(
                      (pageController.page! + 1).toInt(),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                icon: Icon(Icons.chevron_right_rounded)),
          ],
        )),
      ]),
    );
  }
}

class ProjectGridView extends StatelessWidget {
  late List<Project> projects;
  ProjectGridView({Key? key}) : super(key: key);

  List<Widget> generateProjectTiles(List<Project> projects) {
    List<Widget> tiles = List.generate(
        projects.length, (index) => ProjectTile(project: projects[index]));
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    List<Project> projects = Provider.of<ProjectState>(context).projects;
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: generateProjectTiles(projects),
    );
  }
}

class ProjectTile extends StatelessWidget {
  final Project project;
  const ProjectTile({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 400,
        minHeight: 300,
      ),
      margin: EdgeInsets.all(10),
      child: AspectRatio(
        aspectRatio: .9,
        child: Card(
          elevation: 8,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/dashboard.png',
                    // height: 200,
                    // width: 200,
                  ),
                  Container(
                      child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(),
                      Text(project.name,
                          style: Theme.of(context).textTheme.subtitle1),
                      IconButton(
                          icon: Icon(Icons.open_in_new_rounded),
                          onPressed: () {}),
                    ],
                  )),
                  // ListTile(
                  //   leading: CircleAvatar(),
                  //   title: Text('Project Name'),
                  //   subtitle: Text('Description'),
                  //   trailing: IconButton(
                  //       icon: Icon(Icons.open_in_new_rounded),
                  //       onPressed: () {}),
                  // )
                  // Center(
                  //   child: Text('Project$widget',
                  //       style: Theme.of(context).textTheme.headline6),
                  // ),
                ]),
          ),
        ),
      ),
    );
  }
}

class Project {
  final String name;
  final String description;
  // final List<Photo> photos;
  final Image photo;
  final String tools;
  final String takeAways;

  Project(this.name, this.description, this.photo, this.tools, this.takeAways);
}
