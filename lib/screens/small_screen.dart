import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:portfolio_site/screens/main_body_content.dart';

class SmallBodyContent extends StatelessWidget {
  SmallBodyContent({Key? key}) : super(key: key);

  List<Project> projects = List.generate(
      5,
      (index) => Project(
          'name$index',
          'description',
          Image(
            image: AssetImage('dashboard.png'),
          ),
          'tools',
          'takeAways'));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Photo(),
            Bio(),
            ProjectPageView(projects: projects),
            ContactPage()
          ],
        ),
      ),
    );
  }
}

class ProjectPageView extends StatelessWidget {
  final List<Project> projects;
  const ProjectPageView({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(viewportFraction: 1, initialPage: 0);
    log(projects.length.toString());
    return Container(
      height: 540,
      margin: EdgeInsets.all(20),
      child: 
      // PageView(
      //   controller: controller,
      //   children: [
      //     ProjectTile(project: projects[0]),
      //     ProjectTile(project: projects[1]),
      //     ProjectTile(project: projects[2]),
      //     ProjectTile(project: projects[3]),
      //     ProjectTile(project: projects[4]),
      //   ],
      // )
      PageView.builder(
          itemCount: projects.length,
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(10),
              child: ProjectTile(project: projects[index]));
          }),
    );
  }
}

class Photo extends StatelessWidget {
  const Photo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}

class Bio extends StatelessWidget {
  const Bio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}

class ProjectTile extends StatelessWidget {
  final Project project;
  const ProjectTile({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
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
            Text(project.name,
                style: Theme.of(context).textTheme.subtitle1),
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
