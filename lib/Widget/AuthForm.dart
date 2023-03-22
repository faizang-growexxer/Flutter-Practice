import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final String action;
  final ValueSetter onSubmit;
  const AuthForm({super.key, required this.action, required this.onSubmit});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
              controller: usernameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  icon: Icon(Icons.person), labelText: 'Username'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username cannot be empty';
                }
                return null;
              },
            ),
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  icon: Icon(Icons.person), labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name cannot be empty';
                }
                return null;
              },
            ),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  icon: Icon(Icons.phone), labelText: 'Phone no.'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone number cannot be empty';
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  icon: Icon(Icons.password), labelText: 'Password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password cannot be empty';
                }
                return null;
              },
            ),
            TextFormField(
              controller: confirmPasswordController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  icon: Icon(Icons.password), labelText: 'Confirm Password'),
              validator: (value) {
                if (value == null || value.isEmpty || value != confirmPasswordController.text) {
                  return 'Password doesnt match';
                }
                return null;
              },
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO : callback function and write logic accordingly in signup and signin screen
                      // widget.onSubmit();
                    }
                  },
                  child: Text(widget.action),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
