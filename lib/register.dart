// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aqua_trace/services/auth_services.dart';
import 'package:aqua_trace/ui/buttons.dart';
import 'package:aqua_trace/ui/square_tile.dart';
import 'package:aqua_trace/ui/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  final Function()? onTap;
  register({super.key, required this.onTap});

  @override
  State<register> createState() => registerState();
}

class registerState extends State<register> {
  //  controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmpasswordController = TextEditingController();

  void showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }

  // sign up
  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordController.text == confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else
        showMessage("Password is not same");

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      showMessage(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(backgroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //logo

            Icon(
              Icons.waterfall_chart_rounded,
              size: 50,
            ),
            SizedBox(
              height: 25,
            ),

            //welcome text

            Text(
              'Let\'s create an account',
              style: TextStyle(color: Colors.amber, fontSize: 16),
            ),
            SizedBox(
              height: 15,
            ),

            //username
            textfield(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),

            //password
            textfield(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true),
            // SizedBox(
            //   height: 10,
            // ),

            //confirm password
            textfield(
                controller: confirmpasswordController,
                hintText: 'Confirm Password',
                obscureText: true),
            SizedBox(
              height: 15,
            ),

            // forget password

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Text(
            //         'Forgot Password?',
            //         style: TextStyle(color: Colors.white70),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 15,
            // ),

            // sign in
            button(
              text: "Sign UP ",
              OnTap: signUserUp,
            ),
            SizedBox(
              height: 50,
            ),

            // continue with
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.black,
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or Continue with',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.50,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 25,
            ),
            // google+ facebook auth

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // google
                Square_tile(
                    onTap: () => AuthService().signInWithGoogle(),
                    imagePath: 'assets/google1.png'),

                SizedBox(
                  height: 50,
                  width: 20,
                ),

                //fb
                Square_tile(onTap: () {}, imagePath: 'assets/google1.png'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Login now',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
