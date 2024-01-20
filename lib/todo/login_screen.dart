import 'package:flutter/material.dart';
import 'package:recape_flutter/todo/todo_list.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  String v = value ?? "";
                  if (v.isEmpty) {
                    return "Plesse Enter Your Email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _passwordEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  String v = value ?? "";
                  if (v.isEmpty) {
                    return "Enter Your Password";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {

                   if(_globalKey.currentState!.validate()){
                     clear();
                     Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(
                         builder: (context) => TodoList(),
                       ),
                     );
                   }
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void clear() {
    _passwordEditingController.clear();
    _emailEditingController.clear();
  }
}
