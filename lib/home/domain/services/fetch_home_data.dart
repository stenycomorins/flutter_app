import 'dart:async';

import 'package:flutter_app/home/domain/models/home_data_model.dart';
import 'package:http/http.dart' as http;

const url = "http://13.234.42.35:8000/api/cust_mob/recent_fas";

Future<HomeData> fetchHomeData(accessToken) async {
  final http.Response response =
      await http.post(Uri.parse(url), body: {"token": accessToken});
  if (response.statusCode == 200) {
    String responseString = response.body;
    return homeDataFromJson(responseString);
  } else {
    throw Exception("failed");
  }
}
