import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_site/Services/contact_form_services.dart';
import 'package:portfolio_site/components/about_me_views.dart';
import 'package:portfolio_site/components/contact_views.dart';
import 'package:portfolio_site/components/flutter_button.dart';
import 'package:portfolio_site/components/project_views.dart';
import 'package:portfolio_site/screens/small_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';

class LargeScreenHomePage extends StatelessWidget {
  const LargeScreenHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: SingleChildScrollView(
        padding: EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [LargeAboutMeSection(), LargeProjectSection(), LargeContactSection()],
          ),
      ),
    );
  }
}

class LargeAboutMeSection extends StatelessWidget {
  const LargeAboutMeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: AboutMe()),
          SizedBox(width: 80,),
          Expanded(child: ExperienceAndEducation())
        ],
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Hi,\nWelcome to my portfolio website.\nI am an aspiring software engineer.',
              style: Theme.of(context).textTheme.headline2),
          OutlinedButton(
              onPressed: () {},
              child: Text('Contact Me',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.cyan)),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.all(20),
                minimumSize: Size(200, 100),
                side: BorderSide(width: 4, color: Colors.cyan),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ))
        ],
      ),
    );
  }
}

class LargeProjectSection extends StatelessWidget {
  LargeProjectSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Column(
                children: [
                  Text('Projects',
                      style: Theme.of(context).textTheme.headline4),
                  // FlutterButton()
                ],
              ),
            ),
            Container(child: ProjectGridView()),
          ]),
    );
  }
}

class LargeContactSection extends StatelessWidget {
  LargeContactSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
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
        ));
  }
}
