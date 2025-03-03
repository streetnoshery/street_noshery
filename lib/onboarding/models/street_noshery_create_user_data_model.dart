class StreetNosheryCreateuserDatamodel {
  String? mobileNumber;
  String? countryCode;
  String? email;
  String? password;
  String? userName;
  StreetNosheryShopAddress? address;

  StreetNosheryCreateuserDatamodel({
    this.mobileNumber,
    this.countryCode,
    this.email,
    this.password,
    this.userName,
    this.address,
  });
}

class StreetNosheryShopAddress {
  final String? firstLine;
  final String? secondLine;
  final int? shopId;

  StreetNosheryShopAddress({this.firstLine, this.secondLine, this.shopId});
}