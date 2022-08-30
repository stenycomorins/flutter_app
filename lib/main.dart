import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home/index.dart';
import 'login/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const TabNavigation(),
        '/userslist': (context) => const UsersListScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == TakePictureScreen.routeName) {
          final args = settings.arguments as List<CameraDescription>;
          return MaterialPageRoute(
            builder: (context) {
              return TakePictureScreen(cameras: args);
            },
          );
        }
        return null;
      },
    );
  }
}
