import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                "https://images.unsplash.com/photo-1547721064-da6cfb341d50?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/pxfuel.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
