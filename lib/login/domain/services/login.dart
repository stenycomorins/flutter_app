import 'dart:async';

import 'package:flutter_app/login/domain/models/error_model.dart';
import 'package:flutter_app/login/domain/models/login_model.dart';
import 'package:http/http.dart' as http;

const url = "http://13.234.42.35:8000/api/cust_mob/login";

Future<dynamic> login(Map<String, dynamic> reqData) async {
  final http.Response response = await http.post(Uri.parse(url), body: reqData);
  if (response.statusCode == 200) {
    String responseString = response.body;
    return loginDataFromJson(responseString);
  } else {
    return errorDataFromJson(response.body);
  }
}
