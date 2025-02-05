
class StreetNosheryCartFirebaseStaticDataModel {
  final SavingsCorner? savingCorner;
  final String? emptyCartTitle;
  final List<String>? serviceChoice;
  final Bill? bill;
  final String? primaryCTA;
  final String? title;

  StreetNosheryCartFirebaseStaticDataModel({
    this.savingCorner,
    this.emptyCartTitle,
    this.serviceChoice,
    this.bill,
    this.primaryCTA,
    this.title,
  });

  factory StreetNosheryCartFirebaseStaticDataModel.fromJson(Map<String, dynamic> json) {
    return StreetNosheryCartFirebaseStaticDataModel(
      savingCorner: json['savingCorner'] != null
          ? SavingsCorner.fromJson(json['savingCorner'])
          : null,
      emptyCartTitle: json['emptyCartTitle'],
      serviceChoice: json['serviceChoice'] != null
          ? List<String>.from(json['serviceChoice'])
          : null,
      bill: json['bill'] != null ? Bill.fromJson(json['bill']) : null,
      primaryCTA: json['primaryCTA'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'savingCorner': savingCorner?.toJson(),
      'emptyCartTitle': emptyCartTitle,
      'serviceChoice': serviceChoice,
      'bill': bill?.toJson(),
      'primaryCTA': primaryCTA,
      'title': title,
    };
  }
}

class SavingsCorner {
  final String? subtitle;
  final String? title;

  SavingsCorner({this.subtitle, this.title});

  factory SavingsCorner.fromJson(Map<String, dynamic> json) {
    return SavingsCorner(
      subtitle: json['subtitle'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subtitle': subtitle,
      'title': title,
    };
  }
}

class Bill {
  final String? deliveryFee;
  final String? subTitle;
  final String? totalitem;
  final String? pay;
  final String? restaurantCharges;
  final String? title;
  final String? platformFee;

  Bill({
    this.deliveryFee,
    this.subTitle,
    this.totalitem,
    this.pay,
    this.restaurantCharges,
    this.title,
    this.platformFee,
  });

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      deliveryFee: json['deliveryFee'],
      subTitle: json['subTitle'],
      totalitem: json['totalitem'],
      pay: json['pay'],
      restaurantCharges: json['restaurantCharges'],
      title: json['title'],
      platformFee: json['platformFee'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deliveryFee': deliveryFee,
      'subTitle': subTitle,
      'totalitem': totalitem,
      'pay': pay,
      'restaurantCharges': restaurantCharges,
      'title': title,
      'platformFee': platformFee,
    };
  }
}
