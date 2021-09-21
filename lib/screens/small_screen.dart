import 'dart:developer';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/Services/project_services.dart';
import 'package:portfolio_site/components/project_grid.dart';
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
          children: [
            Photo(),
            Bio(),
            ProjectPageView(projects: projects, projectTileHeight: 300),
            ContactPage()
          ],
        ),
      ),
    );
  }
}

class ProjectSection extends StatelessWidget {
  const ProjectSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 180,
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              children: [
                Text('Projects', style: Theme.of(context).textTheme.headline4),
                FlutterButton()
              ],
            ),
          ),
          ProjectPageView(),
          PageViewDotsRow()
        ],
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
  PageViewDots({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageViewDotsState state = Provider.of<PageViewDotsState>(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: state.activePage == index ? 12 : 8,
      width: state.activePage == index ? 12 : 8,
      decoration: BoxDecoration(
          color: state.activePage == index
              ? Colors.cyan
              : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(25))),
    );
  }
}

class PageViewDotsRow extends StatelessWidget {
  final int? numberOfPages;
  const PageViewDotsRow({Key? key, this.numberOfPages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageViewDotsState state = Provider.of<PageViewDotsState>(context);
    return ListTile(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            List.generate(numberOfPages!, (index) => PageViewDots(index: index)),
      ),
    );
  }
}