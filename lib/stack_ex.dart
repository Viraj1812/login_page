import 'package:flutter/material.dart';
import 'package:login_page/switch_screen.dart';
import 'package:login_page/utils/routes_name.dart';

class StackEX extends StatelessWidget {
  const StackEX({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.blueGrey,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.grey,
            ),
            Positioned(
              top: 100,
              left: 100,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.grey,
              ),
            ),
            const Positioned(
              top: 80,
              left: 68,
              child: Text(
                'Stack',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                RoutesName.secondPage,
                arguments: {
                  'Name': 'Viraj',
                  'Surname': 'Vasani',
                },
              );
            },
            child: const Text('Next'),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const SwitchScreen(),
      ],
    );
  }
}
