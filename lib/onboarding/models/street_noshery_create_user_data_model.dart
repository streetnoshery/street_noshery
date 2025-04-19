class StreetNosheryCreateuserDatamodel {
  String? mobileNumber;
  String? countryCode;
  String? email;
  String? password;
  String? userName;
  String? firstLine;
  String? secondLine;
  String? shopId;

  StreetNosheryCreateuserDatamodel({
    this.mobileNumber,
    this.countryCode,
    this.email,
    this.password,
    this.userName,
    this.firstLine, 
    this.secondLine,
    this.shopId
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (mobileNumber != null) data['mobileNumber'] = mobileNumber;
    if (countryCode != null) data['countryCode'] = countryCode;
    if (email != null) data['email'] = email;
    if (password != null) data['password'] = password;
    if (userName != null) data['userName'] = userName;
    if (firstLine != null) data['firstLine'] = firstLine;
    if (secondLine != null) data['secondLine'] = secondLine;
    if (shopId != null) data['shopId'] = shopId;

    return data;
  }
}
