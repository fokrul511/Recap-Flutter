import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final TextEditingController _titleC = TextEditingController();
  final TextEditingController _ditailsC = TextEditingController();

  List noteList = [];

  alartDialog(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            height: 300,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _globalKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      NewWidget(titleC: _titleC),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _ditailsC,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          label: Text('Enter Your Note'),
                          border: OutlineInputBorder(),
                        ),
                        validator: (String? value) {
                          String v = value ?? "";
                          if (v.isEmpty) {
                            return 'Write anything';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_globalKey.currentState!.validate()) {
                              noteList.add(
                                {
                                  "title": _titleC.text,
                                  "ditails": _ditailsC.text,
                                },
                              );
                              clear();
                              Navigator.pop(context);
                              setState(() {});
                            }
                          },
                          child: Text(
                            'Add Note',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: noteList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                noteList[index]['title'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(noteList[index]['ditails']),
              leading: Icon(Icons.check_box_outline_blank_outlined),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  noteList.remove(noteList[index]);
                  setState(() {

                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add'),
        onPressed: () {
          alartDialog(context);
        },
        icon: Icon(Icons.note_alt_outlined),
      ),
    );
  }

  void clear() {
    _titleC.clear();
    _ditailsC.clear();
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required TextEditingController titleC,
  }) : _titleC = titleC;

  final TextEditingController _titleC;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _titleC,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        label: Text('Enter Your Note Title'),
        border: OutlineInputBorder(),
      ),
      validator: (String? value) {
        String v = value ?? "";
        if (v.isEmpty) {
          return 'Plesse Enter Your Note Title Here';
        }
        return null;
      },
    );
  }
}
