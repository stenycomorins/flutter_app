import 'dart:async';

import 'package:flutter_app/login/domain/models/login_model.dart';
import 'package:http/http.dart' as http;

const url = "https://reqres.in/api/login";

Future<LoginModel> login(Map<String, dynamic> reqData) async {
  final http.Response response =
      await http.post(Uri.parse("https://reqres.in/api/login"), body: reqData);
  if (response.statusCode == 200) {
    String responseString = response.body;
    return loginModelFromJson(responseString);
  } else {
    throw Exception('Album loading failed!');
  }
}
