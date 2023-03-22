import 'package:flutter/material.dart';
import 'package:flutter_practice/screens/ProfileScreen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 16, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  icon: Icon(Icons.email), labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email cannot be empty';
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  icon: Icon(Icons.password), labelText: 'Password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password cannot be empty';
                }
                return null;
              },
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()));

                    // if (_formKey.currentState!.validate()) {
                    //   // TODO : callback function and write logic accordingly in signup and signin screen
                    //   // widget.onSubmit();
                    // }
                  },
                  child: const Text("Signin"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
