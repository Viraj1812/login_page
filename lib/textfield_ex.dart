import 'package:flutter/material.dart';

class TextFieldEx extends StatefulWidget {
  const TextFieldEx({super.key});

  @override
  State<TextFieldEx> createState() => _TextFieldExState();
}

class _TextFieldExState extends State<TextFieldEx> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  String email = '';
  String password = '';
  bool isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
        email = emailController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            buildEmail(),
            const SizedBox(
              height: 24,
            ),
            buildPassword(),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                final isValid = formKey.currentState!.validate();
                if (isValid) {
                  formKey.currentState!.save();
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmail() => TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: 'name@example.com',
          prefixIcon: const Icon(Icons.mail),
          // icon: Icon(Icons.mail),
          border: const OutlineInputBorder(),
          label: const Text('Email'),
          suffixIcon: emailController.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  onPressed: () => emailController.clear(),
                  icon: const Icon(Icons.close),
                ),
        ),
        validator: (value) {
          if (value!.length < 4) {
            return 'Enter at least 4 characters';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        autofocus: true,
        onSaved: (newValue) => setState(() {
          email = newValue!;
        }),
      );

  Widget buildPassword() => TextFormField(
        onSaved: (value) => password = value!,
        decoration: InputDecoration(
          hintText: 'Your Password...',
          label: const Text('Password'),
          suffixIcon: IconButton(
              onPressed: () => setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  }),
              icon: isPasswordVisible
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility)),
          border: const OutlineInputBorder(),
        ),
        obscureText: isPasswordVisible,
      );
}
