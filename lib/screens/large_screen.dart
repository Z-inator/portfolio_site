import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_site/Services/contact_form_services.dart';
import 'package:portfolio_site/components/contact_views.dart';
import 'package:portfolio_site/components/project_views.dart';
import 'package:portfolio_site/screens/small_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';

class LargeScreenBody extends StatelessWidget {
  const LargeScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [AboutMe(), LargeProjectSection(), LargeContactSection()],
        ),
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

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 755,
      padding: EdgeInsets.only(bottom: 40),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 100,
          ),
          Text('Zachary Wauer', style: Theme.of(context).textTheme.headline4),
          Container(
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec bibendum est eu nunc posuere mattis. Morbi commodo gravida velit, vel lobortis dolor sagittis quis. Morbi eget dapibus ante, sed interdum metus. Donec pulvinar sit amet orci in dignissim. Nulla sollicitudin feugiat semper. Quisque auctor ',
              style: Theme.of(context).textTheme.subtitle1,
              softWrap: true,
              maxLines: 10,
            ),
          )
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
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            Container(padding: EdgeInsets.all(20), child: ProjectGridView()),
          ]),
    );
  }
}

class LargeContactSection extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LargeContactSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ContactFormState(formKey: formKey),
        builder: (context, child) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  Text('Contact', style: Theme.of(context).textTheme.headline4),
                  LargeContactForm(),
                ],
              ));
        });
  }
}

class FlutterButton extends StatelessWidget {
  const FlutterButton({
    Key? key,
  }) : super(key: key);

  void launchURL(String url) {
    window.open(url, 'new tab');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Primary Framework:  ',
            style: Theme.of(context).textTheme.headline6),
        //TODO: make this a Textbutton to Flutter's website
        TextButton.icon(
            onPressed: () => launchURL('https://flutter.dev/'),
            icon: CircleAvatar(
              foregroundImage: AssetImage('logos/flutter_logo.png'),
              backgroundColor: Colors.grey,
            ),
            // Image.asset('flutter_logo.png'),
            // ImageIcon(
            //   AssetImage('flutter_logo.png'),
            // ),
            label: Text('Flutter'))
        // Link(
        //     uri: Uri.parse('https://flutter.dev/'),
        //     builder: (context, followLink) {
        //       return TextButton.icon(
        //           onPressed: () => followLink,
        //           icon: CircleAvatar(
        //               foregroundImage: AssetImage('flutter_logo.png')),
        //           // Image.asset('flutter_logo.png'),
        //           // ImageIcon(
        //           //   AssetImage('flutter_logo.png'),
        //           // ),
        //           label: Text('Flutter'));
        //     })
      ],
    );
  }
}
