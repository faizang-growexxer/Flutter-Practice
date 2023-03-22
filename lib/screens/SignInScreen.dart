import 'package:flutter/material.dart';
import 'package:flutter_practice/Widget/SigninForm.dart';
import 'package:flutter_practice/screens/SignUpScreen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signin'),
      ),
      body: Column(
        children: [
          const SignInForm(),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignUpScreen()));
            },
            child: const Text(
              "New user?\nRegister here",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  signin(value) {}
}
