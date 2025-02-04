class StreetNosheryProfileFireBaseModel {
  final AppBarData? appbar;
  final String? primaryButtonTitle;
  final BodyData? body;

  StreetNosheryProfileFireBaseModel({
    this.appbar,
    this.primaryButtonTitle,
    this.body,
  });

  factory StreetNosheryProfileFireBaseModel.fromJson(Map<String, dynamic> json) {
    return StreetNosheryProfileFireBaseModel(
      appbar: json['appbar'] != null ? AppBarData.fromJson(json['appbar']) : null,
      primaryButtonTitle: json['primaryButtonTitle'] as String? ?? '',
      body: json['body'] != null ? BodyData.fromJson(json['body']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appbar': appbar?.toJson(),
      'primaryButtonTitle': primaryButtonTitle,
      'body': body?.toJson(),
    };
  }
}

class AppBarData {
  final String? help;
  final String? editProfile;

  AppBarData({this.help, this.editProfile});

  factory AppBarData.fromJson(Map<String, dynamic> json) {
    return AppBarData(
      help: json['help'] as String? ?? '',
      editProfile: json['editProfile'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'help': help,
      'editProfile': editProfile,
    };
  }
}

class BodyData {
  final AddressSetting? addressSetting;
  final Review? review;
  final AccountSetting? accountSetting;
  final String? pastOrder;
  final String? emptyOrderTitle;

  BodyData({this.addressSetting, this.review, this.accountSetting, this.pastOrder, this.emptyOrderTitle});

  factory BodyData.fromJson(Map<String, dynamic> json) {
    return BodyData(
      addressSetting: json['addressSetting'] != null
          ? AddressSetting.fromJson(json['addressSetting'])
          : null,
      review: json['review'] != null ? Review.fromJson(json['review']) : null,
      accountSetting: json['accountSetting'] != null
          ? AccountSetting.fromJson(json['accountSetting'])
          : null,
      pastOrder: json['pastOrder'],
      emptyOrderTitle: json['emptyOrderTitle']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addressSetting': addressSetting?.toJson(),
      'review': review?.toJson(),
      'accountSetting': accountSetting?.toJson(),
      'pastOrder': pastOrder,
      'emptyOrderTitle': emptyOrderTitle
    };
  }
}

class AddressSetting {
  final String? subTitle;
  final String? title;

  AddressSetting({this.subTitle, this.title});

  factory AddressSetting.fromJson(Map<String, dynamic> json) {
    return AddressSetting(
      subTitle: json['subTitle'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subTitle': subTitle,
      'title': title,
    };
  }
}

class Review {
  final String? subTitle;
  final String? title;

  Review({this.subTitle, this.title});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      subTitle: json['subTitle'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subTitle': subTitle,
      'title': title,
    };
  }
}

class AccountSetting {
  final String? subTitle;
  final String? title;

  AccountSetting({this.subTitle, this.title});

  factory AccountSetting.fromJson(Map<String, dynamic> json) {
    return AccountSetting(
      subTitle: json['subTitle'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subTitle': subTitle,
      'title': title,
    };
  }
}
