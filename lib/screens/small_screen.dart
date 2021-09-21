import 'dart:developer';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/Services/project_services.dart';
import 'package:portfolio_site/components/project_views.dart';
import 'package:portfolio_site/screens/main_body_content.dart';
import 'package:provider/provider.dart';

class SmallBodyContent extends StatelessWidget {
  final List<Project> projects;
  SmallBodyContent({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Photo(), Bio(), ProjectSection(), ContactPage()],
        ),
      ),
    );
  }
}

class ProjectSection extends StatelessWidget {
  ProjectSection({Key? key}) : super(key: key);
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: pageController,
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Text('Projects',
                      style: Theme.of(context).textTheme.headline4),
                  FlutterButton()
                ],
              ),
            ),
            ProjectPageView(),
            PageViewDotsRow()
          ],
        ),
      ),
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

class PageViewDots extends StatelessWidget {
  final int index;
  late PageController pageController;
  PageViewDots({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    pageController = Provider.of<PageController>(context, listen: false);
    log('${pageController.page}');
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: pageController.page!.toInt() == index ? 12 : 8,
      width: pageController.page!.toInt() == index ? 12 : 8,
      decoration: BoxDecoration(
          color:
              pageController.page!.toInt() == index ? Colors.cyan : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(25))),
    );
  }
}

class PageViewDotsRow extends StatelessWidget {
  late int numberOfPages;
  PageViewDotsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    numberOfPages = Provider.of<ProjectState>(context).projects.length;
    return ListTile(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            List.generate(numberOfPages, (index) => PageViewDots(index: index)),
      ),
    );
  }
}
