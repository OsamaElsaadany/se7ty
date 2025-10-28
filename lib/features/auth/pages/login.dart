import 'package:flutter/material.dart';
import 'package:se7ty/core/functions/validemail.dart';
import 'package:se7ty/core/utils/colors.dart';
import 'package:se7ty/core/wedgits/custom.dart';
import 'package:se7ty/core/wedgits/custompass.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.whitecolor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // children: [Image.asset(images.carrot)],
                  ),
                  SizedBox(height: 75.95),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: appcolor.darkcolor,
                    ),
                  ),
                  SizedBox(height: 16.5),
                  Text(
                    'Enter your emails and password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: appcolor.graycolor,
                    ),
                  ),
                  SizedBox(height: 40),
                  tforwedg(
                    label: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter some text ';
                      } else if (!valid_email(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  passforwid(
                    label: 'Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter password';
                      } else if (value.length < 6 || value.length > 12) {
                        return 'Password should be from 8 to 12 chars';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: appcolor.darkcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 31),
                  
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: appcolor.darkcolor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // pushrepla(context, Signup());
                        },
                        child: Text(
                          'Singup',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: appcolor.primarycolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainappScreen {
}
