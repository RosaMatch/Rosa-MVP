import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'constants.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  Login createState() {
    return Login();
  }
}

class Login extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/icon/rosa_icon.png',
              width: 74,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 268.0),
              child: Icon(
                Icons.settings,
                color: Colors.white,
                size: 64,
              ),
            ),
          ],
        ),
        toolbarHeight: 84,
        backgroundColor: rosaRedColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 20, height: 20),
            const Text(
              'Login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: rosaRedColor),
            ),
            const SizedBox(width: 15, height: 15),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: 300, // Set the desired width
                    child: TextFormField(
                      key: const Key('username'),
                      controller: usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 300, // Set the desired width
                    child: TextFormField(
                      key: const Key('password'),
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30, height: 30),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text(
                          'Login successful.\n'
                          'Welcome, ${usernameController.text}!\n'
                          'Password: ${passwordController.text}\n'
                          'You will now be redirected to the Intakes page.',
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    },
                  );
                  Future.delayed(const Duration(seconds: 3), () {
                    if (mounted) {
                      Navigator.of(context).pop();
                      context.go('/intakes');
                    }
                  });
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
