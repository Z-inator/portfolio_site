import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_grid/responsive_grid.dart';

class MainContentBody extends StatelessWidget {
  const MainContentBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [AboutMe(), ProjectsGrid(), ContactPage()],
        ),
      ),
    );
  }
}

class AboutMe extends StatelessWidget {
  // final BoxConstraints pageConstraints;
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 755,
      padding: EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(40.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      'Hi,\nWelcome to my portfolio website.\nI am an aspiring software engineer.', style: Theme.of(context).textTheme.headline2),
                  OutlinedButton(onPressed: () {}, child: Text('Contact Me'))
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(40.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(),
                      Text('Zachary Wauer',
                      style: Theme.of(context).textTheme.headline4)
                    ],
                  ),
                  Container(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec bibendum est eu nunc posuere mattis. Morbi commodo gravida velit, vel lobortis dolor sagittis quis. Morbi eget dapibus ante, sed interdum metus. Donec pulvinar sit amet orci in dignissim. Nulla sollicitudin feugiat semper. Quisque auctor ',
                      softWrap: true,
                      maxLines: 10,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProjectsGrid extends StatelessWidget {
  // final BoxConstraints pageConstraints;
  const ProjectsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> projects = List.generate(8, (int index) => index);
    return Container(
      color: Colors.yellow,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 180,
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                children: [
                  Text('Projects',
                      style: Theme.of(context).textTheme.headline4),
                  FlutterButton()
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.green,
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.spaceAround,
                runAlignment: WrapAlignment.spaceAround,
                children: projects
                    .map(
                      (widget) => Card(
                        elevation: 16,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          // width: 250,
                          // height: 250,
                          child: Column(children: [
                            Image.asset(
                              'assets/dashboard.png',
                              height: 200,
                              width: 200,
                            ),
                            Container(
                                child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(),
                                Text('Project Name',
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                                IconButton(
                                    icon: Icon(Icons.open_in_new_rounded),
                                    onPressed: () {}),
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
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ]),
    );
  }
}

class FlutterButton extends StatelessWidget {
  const FlutterButton({
    Key? key,
  }) : super(key: key);

  void launchURL(String url) {
    window.open(url, 'new tab');
    // try {
    //   await launch(url);
    // } catch (e) {
    //   log(e.toString());
    // }
    // await canLaunch(urlString) ? await launch(url) : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Primary Framework:',
            style: Theme.of(context).textTheme.headline6),
        //TODO: make this a Textbutton to Flutter's website
        TextButton.icon(
            onPressed: () => launchURL('https://flutter.dev/'),
            icon: CircleAvatar(
              foregroundImage: AssetImage('flutter_logo.png'),
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

class ContactPage extends StatelessWidget {
  // final BoxConstraints pageConstraints;
  const ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 760,
      color: Colors.orange,
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              child: Center(
            child:
                Text('Contact', style: Theme.of(context).textTheme.headline4),
          )),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 20),
                            decoration: ShapeDecoration(
                                color: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            child: TextFormField())),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 20),
                            decoration: ShapeDecoration(
                                color: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            child: TextFormField()))
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    decoration: ShapeDecoration(
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: TextFormField()),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    decoration: ShapeDecoration(
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: TextFormField())
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.circle),
              Icon(Icons.circle),
              Icon(Icons.circle)
            ],
          )
        ],
      ),
    );
  }
}
