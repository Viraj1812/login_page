import 'package:flutter/material.dart';
import 'package:login_page/utils/routes_name.dart';

class TabFirstScreen extends StatelessWidget {
  const TabFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Tab 1',
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
