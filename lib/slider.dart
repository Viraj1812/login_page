import 'package:flutter/material.dart';
import 'package:login_page/utils/routes_name.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int _value = 6;
  RangeValues _currentRangeValues = const RangeValues(20, 60);

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

  /* Image Slider

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Image Slider Demo"),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
          alignment: Alignment.center,
          constraints: BoxConstraints.expand(height: 225),
          child: imageSlider(context)),
    );
  }

  Swiper imageSlider(context) {
    return Swiper(
      autoplay: true,
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          "https://lh3.googleusercontent.com/wIcl3tehFmOUpq-Jl3hlVbZVFrLHePRtIDWV5lZwBVDr7kEAgLTChyvXUclMVQDRHDEcDhY=w640-h400-e365-rj-sc0x00ffffff",
          fit: BoxFit.fitHeight,
        );
      },
      itemCount: 10,
      viewportFraction: 0.7,
      scale: 0.8,
    );
  }

  */
}
