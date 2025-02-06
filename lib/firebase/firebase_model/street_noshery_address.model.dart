class StreetNosheryFirebaseModel {
  final String? searchAddress;
  final SavedAddress? savedAddress;
  final String? title;

  StreetNosheryFirebaseModel({this.searchAddress, this.savedAddress, this.title});

  factory StreetNosheryFirebaseModel.fromJson(Map<String, dynamic> json) {
    return StreetNosheryFirebaseModel(
      searchAddress: json['searchAddress'] as String?,
      savedAddress: json['savedAddress'] != null
          ? SavedAddress.fromJson(json['savedAddress'])
          : null,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'searchAddress': searchAddress,
      'savedAddress': savedAddress?.toJson(),
      'title': title,
    };
  }
}

class SavedAddress {
  final String? phoneNumber;
  final String? office;
  final String? title;

  SavedAddress({this.phoneNumber, this.office, this.title});

  factory SavedAddress.fromJson(Map<String, dynamic> json) {
    return SavedAddress(
      phoneNumber: json['phoneNumber'] as String?,
      office: json['office'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'office': office,
      'title': title,
    };
  }
}
