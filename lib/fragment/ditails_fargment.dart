import 'package:flutter/material.dart';

class DitailsScreen extends StatelessWidget {
  final String gridImage;
  final String title;
  final String content;

  const DitailsScreen(
      {super.key,
      required this.gridImage,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title.toString())),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Git Best Repository',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              child: Image(
                image: NetworkImage(gridImage.toString()),
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'About this Repository:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(content),
          ],
        ),
      ),
    );
  }
}
