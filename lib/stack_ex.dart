import 'package:flutter/material.dart';
import 'package:login_page/drop_down.dart';
import 'package:login_page/switch_screen.dart';
import 'package:login_page/utils/routes_name.dart';

class StackEX extends StatelessWidget {
  const StackEX({super.key});

  @override
  Widget build(BuildContext context) {
    var colors = [
      Colors.pink,
      Colors.purple,
    ];
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
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(colors: colors),
            // image: const DecorationImage(
            //   image: AssetImage('assets/images/temp.jpg'),
            // ),
          ),
          alignment: Alignment.center,
          child: MaterialButton(
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
            child: const SizedBox(
              width: double.infinity,
              child: Text(
                'Next',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const SwitchScreen(),
        const DropDownEx()
      ],
    );
  }
}
