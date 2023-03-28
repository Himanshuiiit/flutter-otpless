import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  String token;
  String userName;
  MyHomePage({required this.token, required this.userName});
  @override
  State<MyHomePage> createState() => _MyHomePageState(token: token, userName: userName);
}

class _MyHomePageState extends State<MyHomePage> {
  String token;
  String userName;
  _MyHomePageState({required this.token, required this.userName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: Text('Welcome to Home Screen ${userName}'),
      ),
    );
  }
}
