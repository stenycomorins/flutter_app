import 'dart:async';

import 'package:flutter_app/home/index.dart';
import 'package:http/http.dart' as http;

Future<Userslistmodel> fetchUsersList() async {
  final http.Response response =
      await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
  if (response.statusCode == 200) {
    String responseString = response.body;
    return userslistmodelFromJson(responseString);
  } else {
    throw Exception('Lists loading failed!');
  }
}
