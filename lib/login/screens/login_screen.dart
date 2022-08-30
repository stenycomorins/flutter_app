import 'package:flutter/material.dart';
import 'package:flutter_app/home/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final mobileController = TextEditingController(text: "700832693");
  final pinController = TextEditingController(text: "1234");
  late SharedPreferences prefs;
  late bool isLoggedIn;

  @override
  void initState() {
    super.initState();
    checkIfLoggedAlready();
  }

  void checkIfLoggedAlready() async {
    prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      navigate();
    }
  }

  void navigate() {
    Navigator.pushNamed(context, '/home');
  }

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
                  prefs.setBool('isLoggedIn', true);
                  prefs.setString('token', loginData.data.accessToken);
                  navigate();
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
