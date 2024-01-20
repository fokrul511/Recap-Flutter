import 'package:flutter/material.dart';

class DitailsScreen extends StatelessWidget {
  final String image;
  final String id;
  final String title;

  const DitailsScreen(
      {super.key,
      required this.image,
      required this.id,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title.toString(),)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Api Id :$id'.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              child: Image(
                image: NetworkImage(image.toString()),
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'About this api:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(title.toString()),
          ],
        ),
      ),
    );
  }
}
