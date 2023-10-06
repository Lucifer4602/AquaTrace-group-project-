import 'package:flutter/material.dart';
import 'package:get/get.dart';

class calculatorPage extends StatefulWidget {
  const calculatorPage({super.key});

  @override
  State<calculatorPage> createState() => _calculatorPageState();
}

class _calculatorPageState extends State<calculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.back_hand)),
      ),
    );
  }
}
