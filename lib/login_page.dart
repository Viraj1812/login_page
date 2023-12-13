import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_page/utils/routes_name.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  bool _obscureText = true;
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
              focusNode: f1,
              // onSubmitted: (value) {
              //   FocusScope.of(context).requestFocus(f2);
              // },
              decoration: const InputDecoration(
                  labelText: 'User Name',
                  hintText: 'Enter User Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.white))),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: passwordcontroller,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.text,
              maxLength: 12,
              obscureText: _obscureText,
              onSubmitted: (value) {
                _handleLogin();
              },
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      // Toggle the visibility of the password
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                (usercontroller.text == '' || passwordcontroller.text == '')
                    // ? Fluttertoast.showToast(
                    //     msg: 'Please enter username and password',
                    //     gravity: ToastGravity.BOTTOM,
                    //     toastLength: Toast.LENGTH_LONG,
                    //     timeInSecForIosWeb: 1,
                    //     textColor: Colors.white,
                    //     fontSize: 16.0)
                    ? _showToast(context, 'Please enter username and password')
                    : _handleLogin();
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

  void _handleLogin() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesName.homePage,
      (Route<dynamic> route) => false,
    );
  }
}
