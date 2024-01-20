import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recape_flutter/fragment/ditails_fargment.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data = [];

  getData() async {
    http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    data = jsonDecode(response.body);
    print(data);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Api'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DitailsScreen(
                              image: data[index]['url'],
                              id: data[index]['id'].toString(),
                              title: data[index]['albumId'].toString()),
                        ));
                  },
                  title: Text(
                    data[index]['id'].toString(),
                    style: const TextStyle(fontSize: 22),
                  ),
                  subtitle: Text(data[index]['title']),
                  leading: Image(
                    image: NetworkImage(data[index]['thumbnailUrl']),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 2,
                thickness: 3,
              );
            },
            itemCount: data.length));
  }
}
