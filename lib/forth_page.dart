import 'package:flutter/material.dart';
import 'package:login_page/utils/routes_name.dart';

class ForthPage extends StatelessWidget {
  const ForthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid View'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemCount: 50,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    child: SizedBox(
                      width: 100,
                      height: 100, // Set the desired width
                      child: Center(
                        child: Text('Horizontal Item $index'),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.linearProgress);
              },
              child: const Text(
                'Next',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
