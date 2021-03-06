import 'dart:convert';
import 'dart:html' as html;
import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio_site/Services/project_services.dart';
import 'package:provider/provider.dart';

import 'package:portfolio_site/projects.dart';

class ProjectGridView extends StatelessWidget {
  late List<Project> projects;
  ProjectGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Project> projects = Provider.of<List<Project>>(context);
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300, mainAxisSpacing: 20, crossAxisSpacing: 20),
      children: [...projects.map((project) => ProjectTile(project: project))],
    );
  }

  List<Widget> generateProjectTiles(List<Project> projects) {
    List<Widget> tiles = List.generate(
        projects.length, (index) => ProjectTile(project: projects[index]));
    return tiles;
  }
}

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
    return Row(
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
            return ProjectTile(project: projects[index]);
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
              hoverColor: Colors.blueGrey,
              onTap: () => showBottomSheet(context, snapshot),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Stack(
                    fit: StackFit.expand,
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image(
                        image: AssetImage(snapshot.data![0]),
                        fit: BoxFit.cover,
                      ),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          alignment: Alignment.center,
                          child: Image(image: AssetImage(snapshot.data![0])),
                        ),
                      )
                    ]),
              ),
            )),
            ListTile(
              leading: getFrameworkLogo(project.framework),
              title: Text(project.name, textAlign: TextAlign.center),
              trailing: IconButton(
                  icon: Icon(MdiIcons.github),
                  onPressed: () {
                    launchURL(project.url);
                  }),
            )
          ]),
        );
      },
    );
  }

  Widget getFrameworkLogo(String framework) {
    switch (framework) {
      case 'Flutter':
        return IconButton(
            onPressed: () => launchURL('https://flutter.dev/'),
            icon: Image.asset('assets/logos/flutter_logo_2.png'));
      case 'Django':
        return IconButton(
            onPressed: () => launchURL('https://www.djangoproject.com/'),
            icon: Image.asset('assets/logos/django_logo_2.png'));
      case 'React':
        return IconButton(
            onPressed: () => launchURL('https://reactjs.org/'),
            icon: Image.asset('assets/logos/react_logo_2.png'));
      case 'Python':
        return IconButton(
            onPressed: () => launchURL('https://www.python.org/'),
            icon: Image.asset('assets/logos/python_logo_2.png'));
      default:
        return Icon(Icons.report_problem_rounded);
    }
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

  Future<dynamic> showBottomSheet(
      BuildContext context, AsyncSnapshot<List<String>> snapshot) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 40,
            maxWidth: MediaQuery.of(context).size.width - 80),
        builder: (BuildContext context) {
          return ProjectViewer(images: snapshot.data!, project: project);
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
    return Column(
      children: [
        ListTile(
          tileColor: theme.primaryColor,
          title: Text(project.name,
              style: theme.textTheme.headline4
                  ?.copyWith(color: Colors.blueGrey[50]),
              textAlign: TextAlign.center),
          subtitle: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 5,
                children: project.tools
                    .map((String tool) => Chip(
                        backgroundColor: Colors.blueGrey[50],
                        label: Text(tool)))
                    .toList()),
          ),
          trailing: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.close_rounded,
                color: Colors.blueGrey[50],
              )),
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            children: images
                .map((String imageName) => Image(image: AssetImage(imageName)))
                .toList(),
          ),
        ),
        ListTile(
          leading: IconButton(
              onPressed: () => pageController.previousPage(
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn),
              icon: Icon(Icons.chevron_left_rounded)),
          title: IconButton(
            icon: Icon(Icons.lightbulb_rounded),
            onPressed: () => showDescriptionDialog(context),
          ),
          trailing: IconButton(
              onPressed: () => pageController.nextPage(
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn),
              icon: Icon(Icons.chevron_right_rounded)),
        )
      ],
    );
  }

  Future<dynamic> showDescriptionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                side: BorderSide(color: Colors.blueGrey, width: 4.0)),
            backgroundColor: Colors.blueGrey[50],
            child: Container(
              width: MediaQuery.of(context).size.width * .5,
              constraints: BoxConstraints(maxHeight: 500),
              child: SingleChildScrollView(
                  padding: EdgeInsets.all(40),
                  child: Text(project.description)),
            ),
          );
        });
  }
}
