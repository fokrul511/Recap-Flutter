import 'package:flutter/material.dart';
import '../data/gridVew_data.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: gridImage.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: Image(
                              image: NetworkImage(
                                  gridImage[index]['Image'].toString()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
