import 'package:flutter/material.dart';
import 'package:login_page/stack_ex.dart';
import 'package:login_page/tab_first_screen.dart';
import 'package:login_page/tab_second_screen.dart';
// import 'package:login_page/utils/routes_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  var widgetList = [
    const StackEX(),
    const TabFirstScreen(),
    const TabSecondScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: double.infinity,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Viraj Vasani"),
              accountEmail: Text("viraj.vasani1218@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "VV",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: const Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: widgetList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        iconSize: 40,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.contact_page),
            label: 'Contact',
            backgroundColor: Colors.blue.shade400,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.inbox),
            label: 'Inbox',
            backgroundColor: Colors.blue.shade400,
            tooltip: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.mail),
            label: 'Contact',
            backgroundColor: Colors.blue.shade400,
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
