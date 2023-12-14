import 'package:flutter/material.dart';
import 'package:login_page/utils/routes_name.dart';

class ForthPage extends StatelessWidget {
  const ForthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Grid View',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        flexibleSpace: MyFlexibleSpace(),
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

class MyFlexibleSpace extends StatelessWidget {
  const MyFlexibleSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Image.asset(
        'assets/images/temp.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
