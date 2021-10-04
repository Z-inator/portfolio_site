import 'package:flutter/material.dart';


class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 755,
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
            child: Text('Zachary Wauer', style: Theme.of(context).textTheme.headline4)
          ),
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