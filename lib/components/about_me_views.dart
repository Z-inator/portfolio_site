import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ),
      // GridView(
      //   shrinkWrap: true,
      //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //     maxCrossAxisExtent: 500,
      //     mainAxisSpacing: 40,
      //     crossAxisSpacing: 40),
      //     children: [
      //       Container(
      //         child: Column(
      //           children: [
      //             CircleAvatar(
      //               radius: 100,
      //             ),
      //             Container(
      //               padding: EdgeInsets.symmetric(vertical: 40),
      //               child: Text('Zachary Wauer', style: Theme.of(context).textTheme.headline4)
      //             ),
      //           ],
      //         ),
      //       ),
      //       Container(
      //         child: Text(
      //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec bibendum est eu nunc posuere mattis. Morbi commodo gravida velit, vel lobortis dolor sagittis quis. Morbi eget dapibus ante, sed interdum metus. Donec pulvinar sit amet orci in dignissim. Nulla sollicitudin feugiat semper. Quisque auctor ',
      //           style: Theme.of(context).textTheme.subtitle1,
      //           softWrap: true,
      //           maxLines: 10,
      //         ),
      //       )
      //     ])
    );
  }
}

class MySkills extends StatelessWidget {
  const MySkills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Experience & Education', style: theme.textTheme.headline4),
          Container(
            child: SkillBars(skillLevel: .8, skillColor: Colors.blue),
          ),
          // Row(
          //   children: [
          //     Expanded(child: RecentJobBlock(position: 'Executive Coordinator', company: 'Deloitte', timeBlock: '2019 - Present')),
          //     Expanded(child: RecentJobBlock(position: 'Market Development Representative', company: 'Active Network', timeBlock: '2018 - 2019'))
          //   ],
          // )
        ],
      ),
    );
  }
}

// class SkillBars extends StatelessWidget {
//   final int skillLevel;
//   const SkillBars({Key? key, required this.skillLevel}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder(tween: IntTween(begin: 0, end: skillLevel), duration: Duration(milliseconds: 500), builder: (context, int skill, child) {
//       return
//     });
//   }
// }

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
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
        upperBound: widget.skillLevel)
      ..addListener(() {
        setState(() {});
        _controller.repeat(reverse: true);
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: _controller.value,
      backgroundColor: Colors.grey,
      // color: widget.skillColor,
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
