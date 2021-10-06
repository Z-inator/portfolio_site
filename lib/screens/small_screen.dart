import 'dart:developer';
import 'dart:html';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/Services/project_services.dart';
import 'package:portfolio_site/components/about_me_views.dart';
import 'package:portfolio_site/components/contact_views.dart';
import 'package:portfolio_site/components/flutter_button.dart';
import 'package:portfolio_site/components/project_views.dart';
import 'package:portfolio_site/screens/large_screen.dart';
import 'package:provider/provider.dart';

class SmallScreenHomePage extends StatelessWidget {
  SmallScreenHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            SmallAboutMeSection(),
            SmallProjectSection(),
            SmallContactSection()
          ],
        ),
      ),
    );
  }
}

class SmallAboutMeSection extends StatelessWidget {
  const SmallAboutMeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AboutMe(),
          SizedBox(
            height: 40,
          ),
          ExperienceAndEducation()
        ],
      ),
    );
  }
}

class SmallProjectSection extends StatelessWidget {
  SmallProjectSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageViewDotsState(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 40),
              child: Text('Projects',
                  style: Theme.of(context).textTheme.headline4),
            ),
            Expanded(child: ProjectPageView()),
            PageViewDotsRow()
          ],
        ),
      ),
    );
  }
}

class SmallContactSection extends StatelessWidget {
  const SmallContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
            padding: EdgeInsets.only(bottom: 40),
            child:
                Text('Contact', style: Theme.of(context).textTheme.headline4)),
        SmallContactForm(),
      ],
    ));
  }
}

class PageViewDots extends StatelessWidget {
  final int index;
  late PageController pageController;
  late AnimationController animationController;
  PageViewDots({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    PageViewDotsState pageViewDotsState =
        Provider.of<PageViewDotsState>(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: pageViewDotsState.activePage == index ? 12 : 8,
      width: pageViewDotsState.activePage == index ? 12 : 8,
      decoration: BoxDecoration(
          color:
              pageViewDotsState.activePage == index ? theme.primaryColor : Colors.grey[600],
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
