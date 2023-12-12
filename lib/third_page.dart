import 'package:flutter/material.dart';
import 'package:login_page/home_page.dart';
import 'package:login_page/login_page.dart';
import 'package:login_page/utils/routes_name.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Expanded(
        child: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RoutesName.loginPage, (Route<dynamic> route) => false);
            },
            child: const Text('Logout'),
          ),
        ),
      ),
    );
  }
}
