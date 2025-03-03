class StreetNosheryShopsModelShop {
  final ShopAddress? shopAddress;

  StreetNosheryShopsModelShop({
    this.shopAddress,
  });

  factory StreetNosheryShopsModelShop.fromJson(Map<String, dynamic> json) {
    return StreetNosheryShopsModelShop(
      shopAddress: json['shopAddress'] != null 
          ? ShopAddress.fromJson(json['shopAddress']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shopAddress': shopAddress?.toJson(),
    };
  }
}

class ShopAddress {
  final String addressLine1;
  final String? addressLine2;
  final String shopId;

  ShopAddress({
    required this.addressLine1,
    this.addressLine2,
    required this.shopId,
  });

  factory ShopAddress.fromJson(Map<String, dynamic> json) {
    return ShopAddress(
      addressLine1: json['addressLine1'] as String,
      addressLine2: json['addressLine2'] as String?,
      shopId: json['shopId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addressLine1': addressLine1,
      if (addressLine2 != null) 'addressLine2': addressLine2,
      'shopId': shopId,
    };
  }
}
