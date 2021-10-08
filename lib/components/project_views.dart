import 'dart:convert';
import 'dart:developer';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
    List<Project> projects = Provider.of<List<Project>>(context);
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
              pageController
                ..animateToPage((pageController.page! + 1).toInt(),
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn);
            },
            icon: Icon(Icons.chevron_right_rounded)),
      ],
    ));
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
    List<Project> projects = Provider.of<List<Project>>(context);
    return Container(
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
  late List<String> images = ['assets/dashboard.png'];
  ProjectTile({Key? key, required this.project}) : super(key: key);

  Future<List<dynamic>> getProjectImages(BuildContext context) async {
    List<dynamic> images = [];
      String manifestJson =
          await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
      Map<String, dynamic> manifestMap = await jsonDecode(manifestJson);
      images = manifestMap
          .keys
          .where(
              (String key) => key.contains('assets/${project.photoLocation}'))
          .toList();
    return images;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProjectImages(context),
      initialData: images,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Card(
          elevation: 0,
          clipBehavior: Clip.hardEdge,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Image(
                  image: AssetImage(snapshot.data[0]),
                )
                    // Image.asset(
                    //   images[0],
                    //   fit: BoxFit.none,
                    // ),
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
                            icon: Icon(MdiIcons.github), onPressed: () {}),
                      ],
                    )),
              ]),
        );
      },
    );
  }
}
