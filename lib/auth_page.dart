// ignore_for_file: prefer_const_constructors

import 'package:aqua_trace/cameraPage.dart';
import 'package:aqua_trace/login_or%20_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart ';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return cameraPage();
          } else {
            return loginORregister();
          }
        },
      ),
    );
  }
}
