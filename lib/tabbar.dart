import 'package:flutter/material.dart';
import 'package:login_page/calander.dart';
import 'package:login_page/date_picker.dart';
import 'package:login_page/tab_first_screen.dart';
import 'package:login_page/tab_second_screen.dart';

class Tabber extends StatelessWidget {
  const Tabber({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Tabs Demo'),
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.amber,
            dividerColor: Colors.red,
            dividerHeight: 2,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.all(8),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border(
                  bottom: BorderSide(width: 1),
                  left: BorderSide(width: 1),
                  top: BorderSide(width: 1),
                  right: BorderSide(width: 1),
                ),
                shape: BoxShape.rectangle,
                color: Colors.black),
            tabs: [
              Tab(
                icon: Icon(Icons.contacts),
                text: 'Tab 1',
              ),
              Tab(
                icon: Icon(Icons.camera_alt),
                text: 'Tab 2',
              ),
              Tab(
                icon: Icon(Icons.contacts),
                text: 'Tab 3',
              ),
              Tab(
                icon: Icon(Icons.camera_alt),
                text: 'Tab 4',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TabFirstScreen(),
            TabSecondScreen(),
            DatePickerEx(),
            HomeCalendarPage(),
          ],
        ),
      ),
    );
  }
}
