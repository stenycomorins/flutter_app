import 'package:flutter/material.dart';
import '../index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final pswdController = TextEditingController();
  late Future<LoginModel> _futureLoginData;
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
              onPressed: () {
                var reqData = {
                  "email": emailController.text,
                  "password": pswdController.text,
                };
                print(reqData);
                setState(() {
                  _futureLoginData = login(reqData);
                });
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const HomeScreen()));
              },
              child: const Text('Login'),
            )
          ],
        )));
  }
}
