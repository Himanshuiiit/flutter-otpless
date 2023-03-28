import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:otpless_flutter/otpless_flutter.dart';
import 'package:otpless_poc_1/home_screen.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _otplessFlutterPlugin = Otpless();

  void initiateWhatsappLogin(String intentUrl) async{
    var result = await _otplessFlutterPlugin.loginUsingWhatsapp(intentUrl: intentUrl);
    switch (result['code']) {
      case "581":
        print(result['message']);
        //TODO: handle whatsapp not found
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // ** Function that is called when page is loaded
  // ** We can check the auth state in this function
  Future<void> initPlatformState() async {
    _otplessFlutterPlugin.authStream.listen((token) async {
      final res = await postRequest(token.toString());
      print(token.toString());
      print(jsonDecode(res.body)['data']['userName']);
      final userName = jsonDecode(res.body)['data']['userName'];
      if(token!=null){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage(token: token, userName: userName)),
        );
      }
    });
  }
  Future<http.Response> postRequest(String token) async {
    final response = await http.post(
      Uri.parse('https://theoptionbox.authlink.me'),
      headers: <String, String>{
        'clientId': '2ckbpuqb',
        'clientSecret': 'kshlui5h48a8unlf',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'token': token,
      }),
    );
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Column(
        children:[
          const SizedBox(height: 100,),
          const Text("Login Screen"),
          const SizedBox(height: 100,),
          ElevatedButton(
            onPressed: () {
              initiateWhatsappLogin("https://theoptionbox.authlink.me?redirectUri=otpless://theoptionbox");
            },
            child: const Text("Login with Whatsapp"),
          ),
        ]
    ),
    );
  }
}