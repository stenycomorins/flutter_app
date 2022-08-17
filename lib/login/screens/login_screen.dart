// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_app/home/index.dart';
import '../index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final mobileController = TextEditingController();
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Center(
                  child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx5Li-cm5EBvX5WLKJ1eu7BFW8bg5hnGi_lw&usqp=CAU'),
                radius: 60,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: mobileController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mobile Number',
                    hintText: 'Enter valid Mobile Number'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: pinController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Pin',
                    hintText: 'Enter Secure Password'),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var reqData = {
                  "country_code": "UGA",
                  "mobile_num": mobileController.text,
                  "pin": pinController.text
                };
                var loginData = await login(reqData);
                if (loginData.status == "success") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                              accessToken: loginData.data.accessToken)));
                } else {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Error'),
                      content: Text(loginData.message),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Login'),
            )
          ],
        )));
  }
}
