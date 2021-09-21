import 'dart:developer';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/screens/main_body_content.dart';

class ProjectPageView extends StatelessWidget {
  // late PageController controller;
  ProjectPageView({Key? key,})
      : super(key: key);

  List<Widget> generateProjectTiles() {
    List<Widget> tiles = List.generate(
        projects.length,
        (index) => ProjectTile(project: projects[index]));
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(viewportFraction: 1, initialPage: 0);
    return Container(
      height: 500,
      child:
          Stack(children: [
        PageView.builder(
            itemCount: projects.length,
            controller: controller,
            scrollDirection: Axis.horizontal,
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
                  controller.animateToPage((controller.page! - 1).toInt(),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                icon: Icon(Icons.chevron_left_rounded)),
            IconButton(
                onPressed: () {
                  controller.animateToPage((controller.page! + 1).toInt(),
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
  final List<Project> projects;
  final double projectTileHeight;
  ProjectGridView(
      {Key? key, required this.projects, required this.projectTileHeight})
      : super(key: key);

  List<Widget> generateProjectTiles() {
    List<Widget> tiles = List.generate(
        projects.length,
        (index) => ProjectTile(project: projects[index]));
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: generateProjectTiles(),
    );
  }
}

class ProjectTile extends StatelessWidget {
  final Project project;
  const ProjectTile({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      constraints: BoxConstraints(maxHeight: 400, maxWidth: 300, minHeight: 300, minWidth: 200),
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
                  Text(project.name, style: Theme.of(context).textTheme.subtitle1),
                  IconButton(
                      icon: Icon(Icons.open_in_new_rounded), onPressed: () {}),
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
