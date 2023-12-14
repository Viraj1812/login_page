import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:login_page/utils/routes_name.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  // int _value = 6;
  // RangeValues _currentRangeValues = const RangeValues(20, 60);

  @override

  /* Normal Slider

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Icon(
                    Icons.volume_up,
                    size: 40,
                  ),
                  Expanded(
                    child: Slider(
                      value: _value.toDouble(),
                      min: 1.0,
                      max: 20.0,
                      divisions: 10,
                      activeColor: Colors.green,
                      inactiveColor: Colors.orange,
                      label: 'Set volume value',
                      onChanged: (double newValue) {
                        setState(() {
                          _value = newValue.round();
                        });
                      },
                      semanticFormatterCallback: (double newValue) {
                        return '${newValue.round()} dollars';
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.thirdPage,
                    arguments: {
                      'Name': 'Viraj',
                      'Surname': 'Vasani',
                    },
                  );
                },
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  */
  /*
  //Range Slider

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Range Slider Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Icon(
                    Icons.volume_up,
                    size: 40,
                  ),
                  Expanded(
                    child: RangeSlider(
                      values: _currentRangeValues,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      activeColor: Colors.green,
                      inactiveColor: Colors.red,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(
                          () {
                            _currentRangeValues = values;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.thirdPage,
                    arguments: {
                      'Name': 'Viraj',
                      'Surname': 'Vasani',
                    },
                  );
                },
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  */

  //Image Slider

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              alignment: Alignment.center,
              constraints: const BoxConstraints.expand(height: 225),
              child: imageSlider(context)),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.thirdPage,
                  arguments: {
                    'Name': 'Viraj',
                    'Surname': 'Vasani',
                  },
                );
              },
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }

  var images = ["assets/images/pxfuel.jpg", "assets/images/temp.jpg"];

  Swiper imageSlider(context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          images[index],
          fit: BoxFit.fill,
        );
      },
      autoplay: true,
      itemCount: images.length,
      pagination: const SwiperPagination(),
      control: const SwiperControl(),
    );
  }
}
