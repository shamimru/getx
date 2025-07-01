import 'package:flutter/material.dart';

class Titlepage extends StatelessWidget {
  const Titlepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text("Hello title page"),
      ),
    );
  }
}
