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
      height: 760,
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
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
      // height: 760,
      color: Colors.yellow,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.all(40),
              child: Center(
                child: Text('Projects',
                    style: Theme.of(context).textTheme.headline4),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.lightGreen,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: 
                  ResponsiveGridList(
                    desiredItemWidth: 220,
                    minSpacing: 20,
                    rowMainAxisAlignment: MainAxisAlignment.spaceAround,
                    scroll: false,
                    children: projects.map((widget) => AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: ShapeDecoration(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        child: Center(
                          child: Text('Project$widget',
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ),
                    )).toList()
                  )
                  // GridView.extent(
                  //   scrollDirection: Axis.horizontal,
                  //   maxCrossAxisExtent: 500,
                  //   mainAxisSpacing: 40,
                  //   crossAxisSpacing: 40,
                  //   children: projects,
                  // ),
                ),
              ),
            ),
          ]),
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
