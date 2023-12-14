import 'package:flutter/material.dart';
import 'package:login_page/utils/routes_name.dart';

class TabSecondScreen extends StatelessWidget {
  const TabSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Tab 2',
              style: TextStyle(fontSize: 32.0, color: Colors.black),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.card);
            },
            child: const Text(
              'Next',
            ),
          )
        ],
      ),
    );
  }
}
