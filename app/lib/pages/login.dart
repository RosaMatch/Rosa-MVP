import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/constants.dart';

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
      resizeToAvoidBottomInset : false,
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
                    padding: EdgeInsets.all(6),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        minLines:1,
                        key: const Key('email'),
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                          fillColor: Color.fromRGBO(238, 242, 232, 1),
                          filled: true,),

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

                      child: TextFormField(
                        minLines:1,
                        key: const Key('password'),
                        controller: passwordController,
                        decoration: InputDecoration(
                        hintText: 'Password',
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                        fillColor: Color.fromRGBO(238, 242, 232, 1),
                        filled: true,),
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
              padding: EdgeInsets.only(left: 60, right: 60, top: 40),
              child: Column(children:[ElevatedButton(
                style: loginButtonStyle,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.push('/intakes');
                  }
                },
                child: const Text('Login', style: TextStyle(color: dividerColor)),
              ),
                SizedBox(height:20),
                Divider(
                  color: dividerColor,

                  //width: 326,
                )])),

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
