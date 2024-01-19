import 'package:flutter/material.dart';
import 'package:recape_flutter/fragment/item_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState
    extends State<SecondScreen> /*with SingleTickerProviderStateMixin*/ {
  /* late final TabController _tabController =
      TabController(length: 10, vsync: this);*/
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Second Screen'),
          bottom: TabBar(

            isScrollable: true,
            indicatorWeight: 2,
            indicator: UnderlineTabIndicator(
                insets: const EdgeInsets.symmetric(horizontal: 6),
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(color: Colors.pink, width: 4)),

            tabs: const [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'Profile',
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: 'Setting',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ItemScreen(),
            Text('Profile'),
            Text('Setting'),
          ],
        ),
      ),
    );
  }
}
