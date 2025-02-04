class StreetNosheryMenuFirebaseModel {
  final AppBarData? appbar;
  final String? primaryCtaTitle;
  final MenuData? menu;
  final String? recentBroughtTitle;

  StreetNosheryMenuFirebaseModel({
    this.appbar,
    this.primaryCtaTitle,
    this.menu,
    this.recentBroughtTitle,
  });

  factory StreetNosheryMenuFirebaseModel.fromJson(Map<String, dynamic> json) {
    return StreetNosheryMenuFirebaseModel(
      appbar: json['appbar'] != null ? AppBarData.fromJson(json['appbar']) : null,
      primaryCtaTitle: json['primaryCtaTitle'] as String? ?? '',
      menu: json['menu'] != null ? MenuData.fromJson(json['menu']) : null,
      recentBroughtTitle: json['recentBroughtTitle'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appbar': appbar?.toJson(),
      'primaryCtaTitle': primaryCtaTitle,
      'menu': menu?.toJson(),
      'recentBroughtTitle': recentBroughtTitle,
    };
  }
}

class AppBarData {
  final String? rating;
  final String? deliveryTimeMin;

  AppBarData({this.rating, this.deliveryTimeMin});

  factory AppBarData.fromJson(Map<String, dynamic> json) {
    return AppBarData(
      rating: json['rating'] as String? ?? '',
      deliveryTimeMin: json['deliveryTimeMin'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'deliveryTimeMin': deliveryTimeMin,
    };
  }
}

class MenuData {
  final String? removeItemButton;
  final String? breakfastTitle;
  final String? sidesAndDrinksTitle;
  final String? thaliAndCombosTitle;
  final String? moreDetail;
  final String? increaseButton;

  MenuData({
    this.removeItemButton,
    this.breakfastTitle,
    this.sidesAndDrinksTitle,
    this.thaliAndCombosTitle,
    this.moreDetail,
    this.increaseButton,
  });

  factory MenuData.fromJson(Map<String, dynamic> json) {
    return MenuData(
      removeItemButton: json['removeItemButton'] as String? ?? '',
      breakfastTitle: json['breakfastTitle'] as String? ?? '',
      sidesAndDrinksTitle: json['sidesAndDrinksTitle'] as String? ?? '',
      thaliAndCombosTitle: json['thaliAndCombosTitle'] as String? ?? '',
      moreDetail: json['moreDetail'] as String? ?? '',
      increaseButton: json['increaseButton'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'removeItemButton': removeItemButton,
      'breakfastTitle': breakfastTitle,
      'sidesAndDrinksTitle': sidesAndDrinksTitle,
      'thaliAndCombosTitle': thaliAndCombosTitle,
      'moreDetail': moreDetail,
      'increaseButton': increaseButton,
    };
  }
}
