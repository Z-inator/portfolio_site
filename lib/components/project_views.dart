import 'dart:developer';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/Services/project_services.dart';
import 'package:portfolio_site/screens/large_screen.dart';
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
    PageViewDotsState pageViewDotsState =
        Provider.of<PageViewDotsState>(context);
    return Container(
        child: Row(
      children: [
        IconButton(
            onPressed: () {
              pageController.animateToPage((pageController.page! - 1).toInt(),
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
            icon: Icon(Icons.chevron_left_rounded)),
        Expanded(
          child: PageView.builder(
              itemCount: projects.length,
              controller: pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (int) => pageViewDotsState.changePage(int),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    // margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: ProjectTile(project: projects[index]));
              }),
        ),
        IconButton(
            onPressed: () {
              pageController.animateToPage((pageController.page! + 1).toInt(),
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
            icon: Icon(Icons.chevron_right_rounded)),
      ],
    )
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300, mainAxisSpacing: 20, crossAxisSpacing: 20),
        children: [...projects.map((project) => ProjectTile(project: project))],
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  final Project project;
  const ProjectTile({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(
                'assets/dashboard.png',
                fit: BoxFit.none,
              ),
            ),
            Container(
                padding: EdgeInsets.all(10.0),
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
          ]),
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
