import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainContentBody extends StatelessWidget {
  const MainContentBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        color: Colors.blue,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AboutMe(pageConstraints: constraints),
              ProjectsGrid(pageConstraints: constraints),
              ContactPage(pageConstraints: constraints)
            ],
          ),
        ),
      );
    });
  }
}

class AboutMe extends StatelessWidget {
  final BoxConstraints pageConstraints;
  const AboutMe({Key? key, required this.pageConstraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: pageConstraints.maxHeight,
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
  final BoxConstraints pageConstraints;
  const ProjectsGrid({Key? key, required this.pageConstraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> projects = List.generate(8, (index) => Container(
                      decoration: ShapeDecoration(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      child: Center(
                        child: Text('Project$index',
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    ));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      height: pageConstraints.maxHeight,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Center(
                child: Text('Projects',
                    style: Theme.of(context).textTheme.headline4),
              ),
            ),
            Expanded(
              child: GridView.extent(
                maxCrossAxisExtent: 300,
                mainAxisSpacing: 40,
                crossAxisSpacing: 40,
                children: projects,

              )
              // GridView.builder(
              //     physics: NeverScrollableScrollPhysics(),
              //     itemCount: 8,
              //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              //         mainAxisSpacing: 40,
              //         crossAxisSpacing: 40,
              //         maxCrossAxisExtent: 300),
              //     itemBuilder: (context, index) {
              //       return Container(
              //         decoration: ShapeDecoration(
              //             color: Colors.green,
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(25))),
              //         child: Center(
              //           child: Text('Project$index',
              //               style: Theme.of(context).textTheme.headline6),
              //         ),
              //       );
              // }
                  ),
            
          ]),
    );
  }
}

class ContactPage extends StatelessWidget {
  final BoxConstraints pageConstraints;
  const ContactPage({Key? key, required this.pageConstraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      height: pageConstraints.maxHeight,
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
          Expanded(
            child: Container(
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
