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
          children: [
            AboutMe(), 
            ProjectsGrid(), 
            ContactPage()
          ],
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              height: 180,
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Text('Welcome',
                  style: Theme.of(context).textTheme.headline4)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(),
              Column(
                children: [
                  Container(
                    child: Text('About Me',
                        style: Theme.of(context).textTheme.headline5),
                  ),
                  Container(
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec bibendum est eu nunc posuere mattis. Morbi commodo gravida velit, vel lobortis dolor sagittis quis. Morbi eget dapibus ante, sed interdum metus. Donec pulvinar sit amet orci in dignissim. Nulla sollicitudin feugiat semper. Quisque auctor ',
                        softWrap: true),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class ProjectsGrid extends StatelessWidget {
  // final BoxConstraints pageConstraints;
  const ProjectsGrid({Key? key})
      : super(key: key);

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
                children: projects.map((widget) => Card(
                  elevation: 16,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Container(
                    width: 250,
                    height: 250,
                    child: Center(
                      child: Text('Project$widget',
                          style: Theme.of(context).textTheme.headline6),
                    ),
                  ),
                ),
              ).toList(),
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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Primary Framework:', style: Theme.of(context).textTheme.headline6),
        //TODO: make this a Textbutton to Flutter's website
        CircleAvatar(backgroundColor: Colors.blueAccent),
            Text('Flutter')
      ],
    );
  }
}

class ContactPage extends StatelessWidget {
  // final BoxConstraints pageConstraints;
  const ContactPage({Key? key,})
      : super(key: key);

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
