import 'package:flutter/material.dart';
import 'package:recape_flutter/widget/snckBar.dart';

alartDialog(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Do you want Back this apps'),
        content: const Text('in this apps back to your mobile phone '),
        actions: [
           TextButton(
            onPressed: () {
             mySnakeBar('You enjoy your application', context);
             Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
        ],
      );
    },
  );
}
