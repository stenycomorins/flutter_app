// To parse this JSON data, do
//
//     final loginData = loginDataFromJson(jsonString);

import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
  LoginData({
    required this.status,
    required this.statusCode,
    required this.data,
    required this.userId,
  });

  String status;
  int statusCode;
  Data data;
  int userId;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        status: json["status"],
        statusCode: json["status_code"],
        data: Data.fromJson(json["data"]),
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_code": statusCode,
        "data": data.toJson(),
        "user_id": userId,
      };
}

class Data {
  Data({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.dataDefault,
    required this.userId,
  });

  String accessToken;
  String tokenType;
  int expiresIn;
  Default dataDefault;
  int userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        dataDefault: Default.fromJson(json["default"]),
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "default": dataDefault.toJson(),
        "user_id": userId,
      };
}

class Default {
  Default({
    required this.category,
    required this.custName,
    required this.photoPpsPath,
    required this.flowRelMgrName,
    required this.accPrvdrLogos,
    required this.accNumLabel,
    required this.accPrvdrName,
    required this.countryCode,
    required this.currencyCode,
    required this.accPrvdrSupportUssd,
    required this.networkOperatorCode,
    required this.getMobileNoUssd,
  });

  String category;
  CustName custName;
  String photoPpsPath;
  FlowRelMgrName flowRelMgrName;
  Acc accPrvdrLogos;
  Acc accNumLabel;
  Acc accPrvdrName;
  String countryCode;
  String currencyCode;
  List<String> accPrvdrSupportUssd;
  NetworkOperatorCode networkOperatorCode;
  GetMobileNoUssd getMobileNoUssd;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        category: json["category"],
        custName: CustName.fromJson(json["cust_name"]),
        photoPpsPath: json["photo_pps_path"],
        flowRelMgrName: FlowRelMgrName.fromJson(json["flow_rel_mgr_name"]),
        accPrvdrLogos: Acc.fromJson(json["acc_prvdr_logos"]),
        accNumLabel: Acc.fromJson(json["acc_num_label"]),
        accPrvdrName: Acc.fromJson(json["acc_prvdr_name"]),
        countryCode: json["country_code"],
        currencyCode: json["currency_code"],
        accPrvdrSupportUssd:
            List<String>.from(json["acc_prvdr_support_ussd"].map((x) => x)),
        networkOperatorCode:
            NetworkOperatorCode.fromJson(json["network_operator_code"]),
        getMobileNoUssd: GetMobileNoUssd.fromJson(json["get_mobile_no_ussd"]),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "cust_name": custName.toJson(),
        "photo_pps_path": photoPpsPath,
        "flow_rel_mgr_name": flowRelMgrName.toJson(),
        "acc_prvdr_logos": accPrvdrLogos.toJson(),
        "acc_num_label": accNumLabel.toJson(),
        "acc_prvdr_name": accPrvdrName.toJson(),
        "country_code": countryCode,
        "currency_code": currencyCode,
        "acc_prvdr_support_ussd":
            List<dynamic>.from(accPrvdrSupportUssd.map((x) => x)),
        "network_operator_code": networkOperatorCode.toJson(),
        "get_mobile_no_ussd": getMobileNoUssd.toJson(),
      };
}

class Acc {
  Acc({
    required this.uezm,
    required this.cca,
    required this.umtn,
    required this.udfc,
    required this.uflw,
  });

  String uezm;
  String cca;
  String umtn;
  String udfc;
  String uflw;

  factory Acc.fromJson(Map<String, dynamic> json) => Acc(
        uezm: json["UEZM"] ?? '',
        cca: json["CCA"] ?? '',
        umtn: json["UMTN"] ?? '',
        udfc: json["UDFC"] ?? '',
        uflw: json["UFLW"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "UEZM": uezm,
        "CCA": cca,
        "UMTN": umtn,
        "UDFC": udfc,
        "UFLW": uflw,
      };
}

class CustName {
  CustName({
    required this.firstName,
    required this.lastName,
  });

  String firstName;
  String lastName;

  factory CustName.fromJson(Map<String, dynamic> json) => CustName(
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
      };
}

class FlowRelMgrName {
  FlowRelMgrName({
    required this.firstName,
    required this.middleName,
    required this.lastName,
  });

  String firstName;
  dynamic middleName;
  String lastName;

  factory FlowRelMgrName.fromJson(Map<String, dynamic> json) => FlowRelMgrName(
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
      };
}

class GetMobileNoUssd {
  GetMobileNoUssd({
    required this.umtn,
  });

  String umtn;

  factory GetMobileNoUssd.fromJson(Map<String, dynamic> json) =>
      GetMobileNoUssd(
        umtn: json["UMTN"],
      );

  Map<String, dynamic> toJson() => {
        "UMTN": umtn,
      };
}

class NetworkOperatorCode {
  NetworkOperatorCode({
    required this.umtn,
  });

  List<String> umtn;

  factory NetworkOperatorCode.fromJson(Map<String, dynamic> json) =>
      NetworkOperatorCode(
        umtn: List<String>.from(json["UMTN"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "UMTN": List<dynamic>.from(umtn.map((x) => x)),
      };
}
