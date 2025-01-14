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
    return Scaffold(
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 140, bottom: 74),
              child: Image.asset(
                'assets/icons/rosa_icon_circle.png',
                height: 160,
                width: 160,
              )
            ),
            //const SizedBox(width: 15, height: 15),
            
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 300,
                      height: 40,
                      child: TextFormField(
                        key: const Key('email'),
                        controller: emailController,
                        decoration: generateInputDecoration('Email'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 300, // Set the desired width
                      height: 40,
                      child: TextFormField(
                        key: const Key('password'),
                        controller: passwordController,
                        decoration: generateInputDecoration('Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                style: loginButtonStyle,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.push('/intakes');
                  }
                },
                child: const Text('Login'),
              ),
            ),
            Divider(
              color: dividerColor,
              indent: 40,
              endIndent: 40,
              //width: 326,
            )
            // ElevatedButton(
            //   onPressed: () {
            //     print("Hey");
            //   },
            //   child: Text('Login with Google'),
            // )
          ],
        ),
      ),
    );
  }
}
