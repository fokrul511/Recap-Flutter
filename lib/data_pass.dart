import 'package:flutter/material.dart';

class DataPass extends StatelessWidget {
 final String title;
   DataPass({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(title),),
    );
  }
}
