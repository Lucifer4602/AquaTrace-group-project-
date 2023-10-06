// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class button extends StatelessWidget {
  final Function()? OnTap;
  final String text;
  button({Key? key, this.OnTap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
