import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Widget/AuthForm.dart';
import 'SignInScreen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthForm(
              action: 'Signup',
              onSubmit: singup,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()));
              },
              child: const Text(
                "Already a user?\nSignin instead",
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  void singup(value) {}
}
