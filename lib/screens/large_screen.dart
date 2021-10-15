import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_site/components/about_me_views.dart';
import 'package:portfolio_site/components/contact_views.dart';
import 'package:portfolio_site/components/project_views.dart';

class LargeScreenHomePage extends StatelessWidget {
  const LargeScreenHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [LargeAboutMeSection(), SizedBox(height: 40), LargeProjectSection(), SizedBox(height: 40), LargeContactSection()],
        ),
    );
  }
}

class LargeAboutMeSection extends StatelessWidget {
  const LargeAboutMeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: AboutMe()),
        SizedBox(width: 80,),
        Expanded(child: ExperienceAndEducation())
      ],
    );
  }
}

class LargeProjectSection extends StatelessWidget {
  LargeProjectSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 40.0),
            child: Column(
              children: [
                Text('Projects',
                    style: Theme.of(context).textTheme.headline4),
              ],
            ),
          ),
          Container(child: ProjectGridView()),
        ]);
  }
}

class LargeContactSection extends StatelessWidget {
  LargeContactSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 40.0),
          child: Text('Contact',
                  style: Theme.of(context).textTheme.headline4),
        ),
        LargeContactForm(),
      ],
    );
  }
}