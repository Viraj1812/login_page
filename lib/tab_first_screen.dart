import 'package:flutter/material.dart';
import 'package:login_page/utils/routes_name.dart';

class TabFirstScreen extends StatelessWidget {
  const TabFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const Center(
            child: Text(
              'It is a contact tab, which is responsible for displaying the contacts stored in your mobile',
              style: TextStyle(fontSize: 32.0, color: Colors.black),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.thirdPage);
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
