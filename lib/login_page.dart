import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_page/utils/routes_name.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usercontroller = TextEditingController();
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            TextField(
              controller: usercontroller,
              maxLength: 15,
              decoration: const InputDecoration(
                  labelText: 'User Name',
                  hintText: 'Enter User Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.white))),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              onChanged: (text) {
                password = text;
              },
              maxLength: 12,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                (usercontroller.text == '' || password == '')
                    ? Fluttertoast.showToast(
                        msg: 'Please enter username and password',
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_LONG,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0)
                    : Navigator.pushNamed(
                        context,
                        RoutesName.homePage,
                      );
              },
              child: const Text(
                'Login',
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
