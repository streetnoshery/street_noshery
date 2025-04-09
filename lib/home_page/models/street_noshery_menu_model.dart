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
  final String? dishName; // Menu Item
  final String? description; // Menu Item
  final String? price; // Menu Item
  final double? rating; // Menu Item
  final String? image; // Menu Item
  final num? foodId; // Menu Item
  final String? category; // Menu Item
  num? ratingCount;
  num? count; // Other use for count total select same dish

  MenuItem({
    this.dishName,
    this.description,
    this.price,
    this.rating,
    this.image,
    this.foodId,
    this.category,
    this.count,
    this.ratingCount
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      dishName: json['dishName'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      image: json['image'],
      foodId: json['foodId'],
      category: json['category'],
      count: json['count'],
      ratingCount: json['ratingCount']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dishName': dishName,
      'description': description,
      'price': price,
      'rating': rating,
      'image': image,
      'foodId': foodId,
      'category': category,
      'count': count,
      'ratingCount': ratingCount
    };
  }
}
