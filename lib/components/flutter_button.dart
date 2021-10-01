import 'dart:html';

import 'package:flutter/material.dart';

class FlutterButton extends StatelessWidget {
  const FlutterButton({
    Key? key,
  }) : super(key: key);

  void launchURL(String url) {
    window.open(url, 'new tab');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Primary Framework:  ',
              style: Theme.of(context).textTheme.headline6),
          //TODO: make this a Textbutton to Flutter's website
          ElevatedButton.icon(
          onPressed: () => launchURL('https://flutter.dev/'),
          icon: Image.asset('logos/flutter_logo.png', width: 24, height: 24,),
          // CircleAvatar(
          //   foregroundImage: AssetImage('logos/flutter_logo.png'),
          //   backgroundColor: Colors.grey,
          // ),
          label: Text('Flutter')),
          TextButton.icon(
              onPressed: () => launchURL('https://flutter.dev/'),
              icon: CircleAvatar(
                foregroundImage: AssetImage('logos/flutter_logo.png'),
                backgroundColor: Colors.grey,
              ),
              label: Text('Flutter'))
        ],
      ),
    );
  }
}
