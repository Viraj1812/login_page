import 'package:custom_switch_widget/custom_switch_widget.dart';
import 'package:flutter/material.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  SwitchClass createState() => SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
  bool isSwitched1 = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    final CustomSwitchController _controller = CustomSwitchController();
    @override
    void initState() {
      super.initState();
      _controller.addListener(() {
        setState(() {
          isSwitched1 = _controller.value;
        });
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch(
          onChanged: toggleSwitch,
          value: isSwitched,
          activeColor: Colors.blue,
          activeTrackColor: Colors.yellow,
          inactiveThumbColor: Colors.redAccent,
          inactiveTrackColor: Colors.orange,
        ),
        Text(
          textValue,
          style: const TextStyle(fontSize: 20),
        ),
        CustomSwitchWidget(
          controller: _controller,
          activeColor: Colors.blue,
          onChange: (value) {
            if (value) {
              _controller.disable();
            } else {
              _controller.enable();
            }
          },
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          'Value : $isSwitched1',
          style: const TextStyle(
            color: Colors.red,
            fontSize: 25.0,
          ),
        )
      ],
    );
  }
}
