import 'dart:convert';

ErrorData errorDataFromJson(String str) => ErrorData.fromJson(json.decode(str));

String errorDataToJson(ErrorData data) => json.encode(data.toJson());

class ErrorData {
  ErrorData({
    required this.status,
    required this.statusCode,
    required this.message,
  });

  String status;
  int statusCode;
  String message;

  factory ErrorData.fromJson(Map<String, dynamic> json) => ErrorData(
        status: json["status"],
        statusCode: json["status_code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_code": statusCode,
        "message": message,
      };
}
