import 'package:flutter/material.dart';
import 'package:login_page/utils/routes_name.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Card(
                      child: SizedBox(
                        width: 0.5 *
                            MediaQuery.of(context)
                                .size
                                .width, // Set the desired width
                        child: Center(
                          child: Text('Horizontal Item $index'),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('List 2 Item $index'),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.forthPage);
                },
                child: const Text(
                  'Next',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
