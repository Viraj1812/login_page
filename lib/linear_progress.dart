import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_page/utils/routes_name.dart';

class LinearProgressIndicatorApp extends StatefulWidget {
  const LinearProgressIndicatorApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return LinearProgressIndicatorAppState();
  }
}

class LinearProgressIndicatorAppState
    extends State<LinearProgressIndicatorApp> {
  bool _loading = true;
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _loading = false;
    _progressValue = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Linear Progress Bar"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              child: _loading
                  ? LinearProgressIndicator(
                      value: _progressValue,
                      backgroundColor: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8),
                      valueColor: const AlwaysStoppedAnimation(Colors.blueGrey),
                    )
                  // ? CircularProgressIndicator(
                  //     strokeWidth: 5,
                  //     backgroundColor: Colors.blueAccent,
                  //     valueColor: const AlwaysStoppedAnimation(Colors.blueGrey),
                  //     value: _progressValue,
                  //     strokeCap: StrokeCap.round,
                  //   )
                  : const Text("Press button for downloading",
                      style: TextStyle(fontSize: 25)),
            ),
            Text('${(_progressValue * 100).round()}%'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _loading = !_loading;
            _updateProgress();
          });
        },
        tooltip: 'Download',
        child: const Icon(Icons.cloud_download),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (timer) {
      setState(() {
        _progressValue += 0.1;
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          timer.cancel();
          Navigator.pushNamed(
            context,
            RoutesName.tabber,
          );
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}
