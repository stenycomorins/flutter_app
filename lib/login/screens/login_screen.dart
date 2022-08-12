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
  final emailController = TextEditingController();
  final pswdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('Login Home')),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 60.0),
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
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email ID as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: pswdController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Secure Password'),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var reqData = {
                  "email": emailController.text,
                  "password": pswdController.text,
                };
                var loginData = await login(reqData);
                if (loginData.token == "QpwL5tke4Pnpja7X4") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                }
              },
              child: const Text('Login'),
            )
          ],
        )));
  }
}
