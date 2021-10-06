import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:portfolio_site/education_and_certifications.dart';
import 'package:provider/provider.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleAvatar(
          radius: 100,
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Text('Zachary Wauer',
                style: Theme.of(context).textTheme.headline4)),
        Container(
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec bibendum est eu nunc posuere mattis. Morbi commodo gravida velit, vel lobortis dolor sagittis quis. Morbi eget dapibus ante, sed interdum metus. Donec pulvinar sit amet orci in dignissim. Nulla sollicitudin feugiat semper. Quisque auctor ',
            style: Theme.of(context).textTheme.subtitle1,
            softWrap: true,
            maxLines: 10,
          ),
        )
      ],
    );
  }
}

class ExperienceAndEducation extends StatelessWidget {
  const ExperienceAndEducation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text('Experience & Education', style: theme.textTheme.headline4),
        Frameworks(),
        Education(),
      ],
    );
  }
}

class Education extends StatefulWidget {
  Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  bool schoolsIsExpanded = false;
  bool certificatesIsExpanded = false;

  late List<School> schools;
  late List<Certificate> certificates;

  List<bool> itemToExpand = [
    false, // schoolsIsExpanded
    false, // certificatesIsExpanded
  ];

  void launchURL(String url) {
    window.open(url, 'new tab');
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    schools = Provider.of<List<School>>(context);
    certificates = Provider.of<List<Certificate>>(context);
    return Container(
      height: 350,
      child: Card(
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          side: BorderSide(
            color: theme.primaryColor,
            width: 2.0
          )
        ),
        elevation: 0,
        child: ListView(
          children: [
            ListTile(
              title: Text('Schooling', style: TextStyle(color: Colors.white),),
              tileColor: theme.primaryColor,
            ),
            ListView(
              shrinkWrap: true,
              children: schools.map((School school) {
                return ListTile(
                  title: Text(school.name),
                  subtitle: Text(school.study),
                  trailing: Text(school.years),
                );
              }).toList(),
            ),
            ListTile(
              title: Text('Certifications', style: TextStyle(color: Colors.white)),
              tileColor: theme.primaryColor,
            ),
            ListView(
              shrinkWrap: true,
              children: certificates.map((Certificate certificate) {
                return ListTile(
                    title: Text(certificate.course),
                    subtitle: Text(certificate.author),
                    trailing: IconButton(
                        onPressed: () => launchURL(certificate.url),
                        icon: Icon(Icons.open_in_new_rounded)));
              }).toList(),
            )
          ],
        ),
      ),
    );
    // Container(
    //     padding: EdgeInsets.only(bottom: 40),
    //     child: Row(
    //       children: [
    //         Expanded(
    //           child: Container(
    //             height: 500,
    //             child: Card(
    //               elevation: 0,
    //               child: ListView(
    //                 children: schools.map((School school) {
    //                     return ListTile(
    //                       title: Text(school.name),
    //                       subtitle: Text(school.study),
    //                       trailing: Text(school.years),
    //                     );
    //                   }).toList(),
    //               ),
    //             ),
    //           ),
    //         ),
    //         Expanded(
    //           child: Container(
    //             height: 500,
    //             child: Card(
    //               elevation: 0,
    //               child: ListView(
    //                 children: certificates.map((Certificate certificate) {
    //                   return ListTile(
    //                       title: Text(certificate.course),
    //                       subtitle: Text(certificate.author),
    //                       trailing: IconButton(
    //                           onPressed: () => launchURL(certificate.url),
    //                           icon: Icon(Icons.open_in_new_rounded)));
    //                 }).toList(),
    //               ),
    //             ),
    //           ),
    //         )
    //         // Expanded(
    //         //   child: ExpansionTile(
    //         //     title: Text('Schooling'),
    //         //     children: schools.map((School school) {
    //         //           return ListTile(
    //         //             title: Text(school.name),
    //         //             subtitle: Text(school.study),
    //         //             trailing: Text(school.years),
    //         //           );
    //         //         }).toList(),
    //         //   )
    //         // ),
    //         // SizedBox(
    //         //   width: 40,
    //         // ),
    //         // Expanded(
    //         //   child: ExpansionTile(
    //         //     title: Text('Certificates'),
    //         //     children: certificates.map((Certificate certificate) {
    //         //           return ListTile(
    //         //               title: Text(certificate.course),
    //         //               subtitle: Text(certificate.author),
    //         //               trailing: IconButton(
    //         //                   onPressed: () => launchURL(certificate.url),
    //         //                   icon: Icon(Icons.open_in_new_rounded)));
    //         //         }).toList(),
    //         //   ),
    //         // )
    //       ],
    //     ));
    // ExpansionPanelList(
    //     expansionCallback: (int index, bool isExpanded) {
    //       setState(() {
    //         itemToExpand[index] = !isExpanded;
    //       });
    //     },
    //     children: [
    //       ExpansionPanel(
    //           headerBuilder: (BuildContext context, bool isExpanded) {
    //             return ListTile(
    //               title: Text('Schooling'),
    //             );
    //           },
    //           body: ListView(
    //             // shrinkWrap: true,
    //             children: schools.map((School school) {
    //               return ListTile(
    //                 title: Text(school.name),
    //                 subtitle: Text(school.study),
    //                 trailing: Text(school.years),
    //               );
    //             }).toList(),
    //           ),
    //           isExpanded: itemToExpand[0]),
    //       ExpansionPanel(
    //           headerBuilder: (BuildContext context, bool isExpanded) {
    //             return ListTile(
    //               title: Text('Certificates'),
    //             );
    //           },
    //           body: ListView(
    //             // shrinkWrap: true,
    //             children: certificates.map((Certificate certificate) {
    //               return ListTile(
    //                   title: Text(certificate.course),
    //                   subtitle: Text(certificate.author),
    //                   trailing: IconButton(
    //                       onPressed: () => launchURL(certificate.url),
    //                       icon: Icon(Icons.open_in_new_rounded)));
    //             }).toList(),
    //           ),
    //           isExpanded: itemToExpand[1])
    //     ]);
  }
}

class Frameworks extends StatelessWidget {
  const Frameworks({Key? key}) : super(key: key);

  void launchURL(String url) {
    window.open(url, 'new tab');
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Container(
            child: Text('Frameworks:', style: theme.textTheme.headline6),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: ElevatedButton(
                  onPressed: () => launchURL('https://flutter.dev/'),
                  child: Container(
                      width: 100,
                      height: 50,
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        'logos/flutter_logo.png',
                      ))),
              title: SkillBars(skillLevel: 1, skillColor: Color(0xFF45D1FD)),
            ),
          ),
          Container(
            child: ListTile(
              leading: ElevatedButton(
                  onPressed: () => launchURL('https://www.djangoproject.com/'),
                  child: Container(
                    width: 100,
                    height: 50,
                    padding: EdgeInsets.all(5),
                    child: Image.asset(
                      'logos/django_logo.png',
                    ),
                  )),
              title: SkillBars(skillLevel: .66, skillColor: Color(0xFF0C4B33)),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: ElevatedButton(
                  onPressed: () => launchURL('https://reactjs.org/'),
                  child: Container(
                    width: 100,
                    height: 50,
                    padding: EdgeInsets.all(5),
                    child: Image.asset(
                      'logos/react_logo.png',
                    ),
                  )),
              title: SkillBars(skillLevel: .33, skillColor: Color(0xFF61DAFB)),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillBars extends StatefulWidget {
  final double skillLevel;
  final Color skillColor;
  const SkillBars(
      {Key? key, required this.skillLevel, required this.skillColor})
      : super(key: key);

  @override
  _SkillBarsState createState() => _SkillBarsState();
}

class _SkillBarsState extends State<SkillBars>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: 0.0, end: widget.skillLevel).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      clipBehavior: Clip.hardEdge,
      child: LinearProgressIndicator(
        value: animation.value,
        backgroundColor: Colors.grey[200],
        color: widget.skillColor,
        minHeight: 10,
      ),
    );
  }
}

class RecentJobBlock extends StatelessWidget {
  final String position;
  final String company;
  final String timeBlock;
  const RecentJobBlock(
      {Key? key,
      required this.position,
      required this.company,
      required this.timeBlock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 150,
      child: Card(
        elevation: 0,
        color: Colors.grey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                position,
                textAlign: TextAlign.left,
                style: theme.textTheme.headline6,
              ),
              Text(
                company,
                textAlign: TextAlign.left,
                style: theme.textTheme.subtitle1,
              ),
              Text(
                timeBlock,
                textAlign: TextAlign.left,
                style: theme.textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
