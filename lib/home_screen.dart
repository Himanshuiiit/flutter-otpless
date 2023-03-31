import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  String token;
  String userName;
  // dynamic user;
  MyHomePage({required this.token, required this.userName,
    // required this.user
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState(token: token, userName: userName,
      // user: user
  );
}

class _MyHomePageState extends State<MyHomePage> {
  String token;
  String userName;
  // dynamic user;
  _MyHomePageState({required this.token, required this.userName,
    // required this.user
  });
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
