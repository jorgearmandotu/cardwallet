import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'wallet',
          style: TextStyle(
              fontSize: 16.3, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(),
    );
  }
}
