import 'package:flutter/material.dart';

class DatePickerEx extends StatefulWidget {
  const DatePickerEx({Key? key}) : super(key: key);

  @override
  State<DatePickerEx> createState() => _DatePickerExState();
}

class _DatePickerExState extends State<DatePickerEx> {
  var date = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                DateTime? datePicked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2024),
                );
                if (datePicked != null) {
                  changeDate(datePicked);
                }
              },
              child: const Text('Show'),
            )
          ],
        ),
      ),
    );
  }

  void changeDate(DateTime datePicked) {
    setState(() {
      date = '${datePicked.day}/${datePicked.month}/${datePicked.year}';
    });
  }
}
