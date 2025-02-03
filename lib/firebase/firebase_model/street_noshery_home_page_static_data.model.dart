class StreetNosheryHomePageFireBaseModel {
  final MenuData? menuTab;
  final RecentBrought? recentBrought;
  final Review? review;
  final AppBarData? appBar;
  final HomePageBestSeller? homePageBestSeller;

  StreetNosheryHomePageFireBaseModel({
    this.menuTab,
    this.recentBrought,
    this.review,
    this.appBar,
    this.homePageBestSeller,
  });

  factory StreetNosheryHomePageFireBaseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return StreetNosheryHomePageFireBaseModel();

    return StreetNosheryHomePageFireBaseModel(
      menuTab: json['homePagetabs'] != null ? MenuData.fromJson(json['homePagetabs']) : null,
      recentBrought: json['recentBrought'] != null ? RecentBrought.fromJson(json['recentBrought']) : null,
      review: json['review'] != null ? Review.fromJson(json['review']) : null,
      appBar: json['appBar'] != null ? AppBarData.fromJson(json['appBar']) : null,
      homePageBestSeller: json['homePageBestSeller'] != null ? HomePageBestSeller.fromJson(json['homePageBestSeller']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menu': menuTab?.toJson(),
      'recentBrought': recentBrought?.toJson(),
      'review': review?.toJson(),
      'appBar': appBar?.toJson(),
      'homePageBestSeller': homePageBestSeller?.toJson(),
    };
  }
}

class MenuData {
  final String menu;
  final String cart;
  final String home;

  MenuData({required this.menu, required this.cart, required this.home});

  factory MenuData.fromJson(Map<String, dynamic>? json) {
    return MenuData(
      menu: json?['menu'] ?? '',
      cart: json?['cart'] ?? '',
      home: json?['home'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'menu': menu, 'cart': cart, 'home': home};
}

class RecentBrought {
  final String rate;
  final String reorder;
  final String title;

  RecentBrought({required this.rate, required this.reorder, required this.title});

  factory RecentBrought.fromJson(Map<String, dynamic>? json) {
    return RecentBrought(
      rate: json?['rate'] ?? '',
      reorder: json?['reorder'] ?? '',
      title: json?['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'rate': rate, 'reorder': reorder, 'title': title};
}

class Review {
  final String textPrefiller;
  final String cancelButton;
  final String submit;
  final String title;

  Review({required this.textPrefiller, required this.cancelButton, required this.submit, required this.title});

  factory Review.fromJson(Map<String, dynamic>? json) {
    return Review(
      textPrefiller: json?['textPrefiller'] ?? '',
      cancelButton: json?['cancelButton'] ?? '',
      submit: json?['submit'] ?? '',
      title: json?['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'textPrefiller': textPrefiller, 'cancelButton': cancelButton, 'submit': submit, 'title': title};
}

class AppBarData {
  final String titlePrefix;

  AppBarData({required this.titlePrefix});

  factory AppBarData.fromJson(Map<String, dynamic>? json) {
    return AppBarData(
      titlePrefix: json?['titlePrefix'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'titlePrefix': titlePrefix};
}

class HomePageBestSeller {
  final String subTitle;
  final String title;

  HomePageBestSeller({required this.subTitle, required this.title});

  factory HomePageBestSeller.fromJson(Map<String, dynamic>? json) {
    return HomePageBestSeller(
      subTitle: json?['subTitle'] ?? '',
      title: json?['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'subTitle': subTitle, 'title': title};
}