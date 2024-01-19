import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StudentData extends StatefulWidget {
  const StudentData({super.key});

  @override
  State<StudentData> createState() => _StudentDataState();
}

class _StudentDataState extends State<StudentData> {
  List studentList = [];

  getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://fokrulislam23.blogspot.com/2024/01/student-info.html'));
    var body = response.body.split("id='post-body-7389221923993316604'>")[1];
    var finaldata = body.split("</div>")[0];
    studentList = jsonDecode(finaldata);
    print(finaldata);
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
        title: Text('Student Info'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Name: ${studentList[index]['name']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                ), Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Age: ${studentList[index]['Age']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                ), Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Department: ${studentList[index]['Department']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                ),

              ],
            )),
          );
        },
        itemCount: studentList.length,
      ),
    );
  }
}
