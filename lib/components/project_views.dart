import 'dart:convert';
import 'dart:html' as html;
import 'dart:ui';

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
  late List<String> dashboardImage = ['assets/dashboard.png'];
  ProjectTile({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProjectImages(context),
      initialData: dashboardImage,
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        return Card(
          elevation: 0,
          clipBehavior: Clip.hardEdge,
          child: Column(children: [
            Expanded(
                child: InkWell(
              onTap: () => showProjectDialog(context, snapshot),
              child: Stack(
                  fit: StackFit.expand,
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image(
                      image: AssetImage(snapshot.data![0]),
                      fit: BoxFit.none,
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.white.withOpacity(0.1),
                        alignment: Alignment.center,
                        child: Image(image: AssetImage(snapshot.data![0])),
                      ),
                    )
                  ]),
            )
                // Image.asset(
                //   images[0],
                //   fit: BoxFit.none,
                // ),
                ),
            ListTile(
              leading: getFrameworkLogo(project.framework),
              title: Text(project.name),
              // subtitle: getFrameworkLogo(project.framework),
              trailing: IconButton(
                  icon: Icon(MdiIcons.github),
                  onPressed: () {
                    launchURL(project.url);
                  }),
            )
            // Container(
            //     padding: EdgeInsets.all(10.0),
            //     child: Row(
            //       mainAxisSize: MainAxisSize.max,
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         // Icon(),
            //         Expanded(
            //           child: Text(project.name,
            //               style: Theme.of(context).textTheme.subtitle1,
            //               overflow: TextOverflow.fade,
            //               maxLines: 3,),
            //         ),
            //         IconButton(
            //             icon: Icon(MdiIcons.github), onPressed: () {}),
            //       ],
            //     )),
          ]),
        );
      },
    );
  }

  Future<List<String>> getProjectImages(BuildContext context) async {
    List<String> images = [];
    String manifestJson =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    Map<String, dynamic> manifestMap = await jsonDecode(manifestJson);
    images = manifestMap.keys
        .where((String key) => key.contains('assets/${project.photoLocation}'))
        .toList();
    return images;
  }

  void launchURL(String url) {
    html.window.open(url, 'new tab');
  }

  Widget getFrameworkLogo(String framework) {
    switch (framework) {
      case 'Flutter':
        return IconButton(
            onPressed: () => launchURL('https://flutter.dev/'),
            icon: Image.asset('logos/flutter_logo_2.png'));
      case 'Django':
        return IconButton(
            onPressed: () => launchURL('https://www.djangoproject.com/'),
            icon: Image.asset('logos/django_logo_2.png'));
      case 'React':
        return IconButton(
            onPressed: () => launchURL('https://reactjs.org/'),
            icon: Image.asset('logos/react_logo_2.png'));
      case 'Python':
        return IconButton(
            onPressed: () => launchURL('https://www.python.org/'),
            icon: Image.asset('logos/python_logo_2.png'));
      default:
        return Icon(Icons.report_problem_rounded);
    }
  }

  Future<dynamic> showProjectDialog(
      BuildContext context, AsyncSnapshot<List<String>> snapshot) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            backgroundColor: Colors.blueGrey[50],
            child: ProjectViewer(images: snapshot.data!, project: project)
          );
        });
  }
}

class ProjectViewer extends StatelessWidget {
  final List<String> images;
  final Project project;
  final PageController pageController = PageController();
  ProjectViewer({Key? key, required this.images, required this.project})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width - 80,
      height: MediaQuery.of(context).size.height - 80,
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            Text(project.name, style: theme.textTheme.headline4),
            Expanded(
              child: PageView(
                controller: pageController,
                children: images.map((String imageName) => Image(image: AssetImage(imageName))).toList(),
              ),
            ),
            ListTile(
              leading: IconButton(onPressed: () => pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn), icon: Icon(Icons.chevron_left_rounded)),
              trailing: IconButton(onPressed: () => pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn), icon: Icon(Icons.chevron_right_rounded)),
            )
          ],
        ),
      ),
    );
  }
}
