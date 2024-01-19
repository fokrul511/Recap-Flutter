import 'package:flutter/material.dart';

mySnakeBar(message, context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 1500),
      backgroundColor: Colors.green,
      dismissDirection: DismissDirection.startToEnd,
      content: Text(message),
      width: 280.0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(8.0),
      action: SnackBarAction(
        label: 'close',
        textColor: Colors.white,
        onPressed: () {},
      ),
    ),
  );
}

