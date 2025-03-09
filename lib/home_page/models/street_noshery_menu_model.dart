class StreetNosheryMenu {
  final String? id;
  final int? shopId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<MenuItem>? menu;

  StreetNosheryMenu({
    this.id,
    this.shopId,
    this.createdAt,
    this.updatedAt,
    this.menu
  });

  factory StreetNosheryMenu.fromJson(Map<String, dynamic> json) {
    return StreetNosheryMenu(
      id: json['_id'] as String?,
      shopId: json['shopId'] as int?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      menu: json['menu'] != null
          ? (json['menu'] as List).map((item) => MenuItem.fromJson(item)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'shopId': shopId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'menu': menu?.map((item) => item.toJson()).toList()
    };
  }
}

class MenuItem {
  final String? dishName;
  final String? description;
  final String? price;
  final double? rating;
  final String? image;
  final num? dishId;
  final String? category;
  num? dishCount;

  MenuItem({
    this.dishName,
    this.description,
    this.price,
    this.rating,
    this.image,
    this.dishId,
    this.category,
    this.dishCount
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      dishName: json['dishName'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      image: json['image'],
      dishId: json['dishId'],
      category: json['category'],
      dishCount: json['dishCount']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dishName': dishName,
      'description': description,
      'price': price,
      'rating': rating,
      'image': image,
      'dishId': dishId,
      'category': category,
      'dishCount': dishCount
    };
  }
}
