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
          foregroundImage: AssetImage('assets/personal.jfif'),
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Text('Zachary Wauer',
                style: Theme.of(context).textTheme.headline4)),
        Container(
          child: Text(
            'I am a Full-Stack Developer located in Dallas, Texas. I have a passion for developing complete multi-platform applications. Most recently, I have been designing, building, and producing Flutter applications on Android, iOS, desktop, and web utilizing Firebase as a back-end. It is fulfilling to use creativity to turn ideas into a digital fabrication. The problem-solving nature of software development is what I enjoy the most. I am a well-organized and independent employee with high attention to detail.\n\nSome of my other computer-related interests include 3D modeling and printing, video game development, and hardware repair and manipulation. I desire to learn and experiment with robotics in the future. I also enjoy fitness, nature, and travel. When planning a trip, I find locations that can satisfy these parameters. My most recent trip was to Seward, Alaska where I hiked a new location every day. My leisure activities include long walks, debating, learning, and playing games.\n\nI have been actively learning and writing software for 3 years now am looking forward to having a career in the field.',
            style: Theme.of(context).textTheme.subtitle1,
            softWrap: true,
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

class Frameworks extends StatelessWidget {
  const Frameworks({Key? key}) : super(key: key);

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
                        'assets/logos/flutter_logo.png',
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
                      'assets/logos/django_logo.png',
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
                      'assets/logos/react_logo.png',
                    ),
                  )),
              title: SkillBars(skillLevel: .33, skillColor: Color(0xFF61DAFB)),
            ),
          ),
        ],
      ),
    );
  }

  void launchURL(String url) {
    window.open(url, 'new tab');
  }
}


class Education extends StatefulWidget {
  Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  late List<School> schools;
  late List<Certificate> certificates;

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
  }

  void launchURL(String url) {
    window.open(url, 'new tab');
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

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

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
}
