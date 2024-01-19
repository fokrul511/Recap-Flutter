import 'package:flutter/material.dart';
import 'package:recape_flutter/widget/simpleFrom.dart';

drawer(context){
  return NavigationDrawer(
    children: [
      const DrawerHeader(
        padding: EdgeInsets.all(0),
        child: UserAccountsDrawerHeader(
          accountName: Text("Fokrul"),
          accountEmail: Text('Email'),
        ),
      ),
      ListTile(
        title: const Text('Home'),
        trailing: const Icon(Icons.home),
        onTap: () {},
      ),ListTile(
        title: const Text('From'),
        trailing: const Icon(Icons.login_outlined),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SimpleFrom(),));
        },
      )
    ],
  );
}