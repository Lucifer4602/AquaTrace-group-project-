import 'package:aqua_trace/login.dart';
import 'package:aqua_trace/register.dart';
import 'package:flutter/material.dart';

class loginORregister extends StatefulWidget {
  const loginORregister({super.key});

  @override
  State<loginORregister> createState() => _loginORregisterState();
}

class _loginORregisterState extends State<loginORregister> {
  // initially show login page

  bool showLoginPage = true;

  // toggle between login and register page

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return login(onTap: togglePages);
    } else
      return register(onTap: togglePages);
  }
}
