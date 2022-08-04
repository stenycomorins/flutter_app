import 'package:flutter/material.dart';
import 'login/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter App',
      home: LoginScreen(),
    );
  }
}

//   final url = "https://jsonplaceholder.typicode.com/posts";

//   void fetchPostsByGet() async {
//     try {
//       final response = await get(Uri.parse(url));
//       final jsonData = jsonDecode(response.body) as List;
//       print(jsonData);
//     } catch (err) {
//       print(err);
//     }
//   }

//   void fetchPostsByPosts() async {
//     try {
//       final response = await post(Uri.parse(url),
//           body: {"title": "Anything", "body": "Post body", "userId": "1"});
//       print(response.body);
//     } catch (err) {
//       print(err);
//     }
//   }