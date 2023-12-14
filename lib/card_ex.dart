import 'package:flutter/material.dart';
import 'package:login_page/utils/routes_name.dart';

class CardEx extends StatelessWidget {
  const CardEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Example'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            surfaceTintColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.purple,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album, size: 60),
                  title: Text('Sonu Nigam',
                      style: TextStyle(fontSize: 30.0, color: Colors.white)),
                  subtitle: Text('Best of Sonu Nigam Music.',
                      style: TextStyle(fontSize: 18.0, color: Colors.white)),
                ),
                ButtonBar(
                  children: <Widget>[
                    OutlinedButton(
                      style: const ButtonStyle(
                        side: MaterialStatePropertyAll(
                            BorderSide(color: Colors.white)),
                      ),
                      child: const Text(
                        'Play',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.thirdPage);
                      },
                    ),
                    OutlinedButton(
                      style: const ButtonStyle(
                        side: MaterialStatePropertyAll(
                            BorderSide(color: Colors.white)),
                      ),
                      child: const Text(
                        'Pause',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
