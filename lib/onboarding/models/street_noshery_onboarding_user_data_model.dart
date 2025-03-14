import 'dart:convert';

import 'package:street_noshery/onboarding/enums/street_noshery_onboarding_status_enums.dart';

class StreetNosheryUser {
  final String? id;
  final String? mobileNumber;
  final int? version;
  final String? countryCode;
  final String? customerId;
  final UserStatus? status;
  final String? email;
  final String? password;
  final Address? address;
  final String? userName;
  final bool? isEmailNotificationEnable;

  StreetNosheryUser({
    this.id,
    this.mobileNumber,
    this.version,
    this.countryCode,
    this.customerId,
    this.status,
    this.email,
    this.password,
    this.address,
    this.userName,
    this.isEmailNotificationEnable,
  });

  factory StreetNosheryUser.fromJson(Map<String, dynamic> json) {
    return StreetNosheryUser(
      id: json['_id'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      version: json['__v'] as int?,
      countryCode: json['countryCode'] as String?,
      customerId: json['customerId'] as String?,
      status: userStatusFromString(json['status']),
      email: json['email'] as String?,
      password: json['password'] as String?,
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      userName: json['userName'] as String?,
      isEmailNotificationEnable: json['isEmailNotificationEnable'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'mobileNumber': mobileNumber,
      '__v': version,
      'countryCode': countryCode,
      'customerId': customerId,
      'status': status,
      'email': email,
      'password': password,
      'address': address?.toJson(),
      'userName': userName,
      'isEmailNotificationEnable': isEmailNotificationEnable,
    };
  }
}

class Address {
  final String? firstLine;
  final String? secondLine;
  final int? shopId;

  Address({this.firstLine, this.secondLine, this.shopId});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      firstLine: json['firstLine'] as String?,
      secondLine: json['secondLine'] as String?,
      shopId: json['shopId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstLine': firstLine,
      'secondLine': secondLine,
      'shopId': shopId,
    };
  }
}

// Convert JSON String to Dart Object
StreetNosheryUser userFromJson(String str) => StreetNosheryUser.fromJson(json.decode(str));

// Convert Dart Object to JSON String
String userToJson(StreetNosheryUser data) => json.encode(data.toJson());

UserStatus userStatusFromString(String? status) {
  switch (status) {
    case "MOBILE_VERIFICATION":
      return UserStatus.MOBILE_VERIFICATION;
    case "EMAIL_VERIFICATION":
      return UserStatus.EMAIL_VERIFICATION;
    case "USER_DETAILS_VERIFICATION":
      return UserStatus.USER_DETAILS_VERIFICATION;
    case "FAILED":
      return UserStatus.FAILED;
    default:
      return UserStatus.UNKNOWN;
  }
}