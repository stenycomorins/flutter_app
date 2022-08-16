// To parse this JSON data, do
//
//     final homeData = homeDataFromJson(jsonString);

import 'dart:convert';

HomeData homeDataFromJson(String str) => HomeData.fromJson(json.decode(str));

String homeDataToJson(HomeData data) => json.encode(data.toJson());

class HomeData {
  HomeData({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.serverTime,
  });

  String status;
  int statusCode;
  dynamic message;
  List<Datum> data;
  DateTime serverTime;

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
        status: json["status"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        serverTime: DateTime.parse(json["server_time"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "server_time": serverTime.toIso8601String(),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.faId,
    required this.amt,
    required this.disDt,
    required this.payDt,
    required this.dur,
    required this.fee,
    required this.paidAmt,
    required this.dueDt,
    required this.apCode,
    required this.acNum,
    required this.prdctId,
  });

  int id;
  String faId;
  int amt;
  DateTime disDt;
  DateTime payDt;
  int dur;
  int fee;
  String paidAmt;
  DateTime dueDt;
  String apCode;
  String acNum;
  int prdctId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        faId: json["fa_id"],
        amt: json["amt"],
        disDt: DateTime.parse(json["dis_dt"]),
        payDt: DateTime.parse(json["pay_dt"]),
        dur: json["dur"],
        fee: json["fee"],
        paidAmt: json["paid_amt"],
        dueDt: DateTime.parse(json["due_dt"]),
        apCode: json["ap_code"],
        acNum: json["ac_num"],
        prdctId: json["prdct_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fa_id": faId,
        "amt": amt,
        "dis_dt": disDt.toIso8601String(),
        "pay_dt":
            "${payDt.year.toString().padLeft(4, '0')}-${payDt.month.toString().padLeft(2, '0')}-${payDt.day.toString().padLeft(2, '0')}",
        "dur": dur,
        "fee": fee,
        "paid_amt": paidAmt,
        "due_dt": dueDt.toIso8601String(),
        "ap_code": apCode,
        "ac_num": acNum,
        "prdct_id": prdctId,
      };
}
