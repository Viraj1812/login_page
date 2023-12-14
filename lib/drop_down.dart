import 'package:flutter/material.dart';

class DropDownEx extends StatefulWidget {
  const DropDownEx({super.key});

  @override
  State<DropDownEx> createState() => _DropDownExState();
}

class _DropDownExState extends State<DropDownEx> {
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            value: dropdownvalue,
            iconEnabledColor: Colors.purple,
            elevation: 20,
            itemHeight: 50,
            isExpanded: true,
            padding: const EdgeInsets.all(20),
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                dropdownvalue = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
