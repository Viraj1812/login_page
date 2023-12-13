import 'package:flutter/material.dart';
import 'package:login_page/utils/routes_name.dart';

enum ConfirmAction { cancel, accept }

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Expanded(
        child: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {
              _confirmDialog(context);
            },
            child: const Text('Logout'),
          ),
        ),
      ),
    );
  }

  _displayDialog(BuildContext context) {
    TextEditingController textFieldController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout Alert'),
          content: TextField(
            controller: textFieldController,
            decoration:
                const InputDecoration(hintText: "Type Logout to move forward"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('SUBMIT'),
              onPressed: () {
                if (textFieldController.text.toLowerCase() == 'logout') {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RoutesName.loginPage, (Route<dynamic> route) => false);
                } else {
                  _showToast(context, 'Please Type as per the given hint');
                }
              },
            )
          ],
        );
      },
    );
  }

  _confirmDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are You Sure?'),
          content: const Text('You want to logout.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.cancel);
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    RoutesName.loginPage, (Route<dynamic> route) => false);
              },
            )
          ],
        );
      },
    );
  }

  void _showToast(BuildContext context, String message) {
    var snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
      shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      elevation: 20,
      showCloseIcon: true,
      closeIconColor: Colors.red,
      dismissDirection: DismissDirection.horizontal,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
