import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Belajar Flutter'),
        ),
        body: const Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}