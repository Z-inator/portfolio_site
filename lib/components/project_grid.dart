import 'dart:developer';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/screens/main_body_content.dart';

class ProjectPageView extends StatelessWidget {
  final List<Project> projects;
  final double projectTileHeight;
  // late PageController controller;
  ProjectPageView(
      {Key? key, required this.projects, required this.projectTileHeight})
      : super(key: key);

  List<Widget> generateProjectTiles() {
    List<Widget> tiles = List.generate(
        projects.length,
        (index) => Container(
            // height: projectTileHeight,
            // constraints: BoxConstraints(maxWidth: 400, minWidth: 300),
            margin: EdgeInsets.all(10),
            child: ProjectTile(project: projects[index])));
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
  // @override
  // Widget build(BuildContext context) {
  //   PageController controller =
  //       PageController(viewportFraction: 1, initialPage: 0);
  //   log(projects.length.toString());
  //   return Container(
  //     height: 540,
  //     child:
  //         // PageView(
  //         //   controller: controller,
  //         //   children: [
  //         //     ProjectTile(project: projects[0]),
  //         //     ProjectTile(project: projects[1]),
  //         //     ProjectTile(project: projects[2]),
  //         //     ProjectTile(project: projects[3]),
  //         //     ProjectTile(project: projects[4]),
  //         //   ],
  //         // )
  //         Stack(children: [
  //       PageView.builder(
  //           itemCount: projects.length,
  //           controller: controller,
  //           scrollDirection: Axis.horizontal,
  //           itemBuilder: (BuildContext context, int index) {
  //             return Container(
  //                 margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
  //                 // padding: EdgeInsets.all(10),
  //                 child: ProjectTile(project: projects[index]));
  //           }),
  //       Center(
  //           child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         mainAxisSize: MainAxisSize.max,
  //         children: [
  //           IconButton(
  //               onPressed: () {
  //                 controller.animateToPage((controller.page! - 1).toInt(),
  //                     duration: Duration(milliseconds: 300),
  //                     curve: Curves.easeIn);
  //               },
  //               icon: Icon(Icons.chevron_left_rounded)),
  //           IconButton(
  //               onPressed: () {
  //                 controller.animateToPage((controller.page! + 1).toInt(),
  //                     duration: Duration(milliseconds: 300),
  //                     curve: Curves.easeIn);
  //               },
  //               icon: Icon(Icons.chevron_right_rounded)),
  //         ],
  //       )),
  //     ]),
  //   );
  // }
}

class ProjectTile extends StatelessWidget {
  final Project project;
  const ProjectTile({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
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
