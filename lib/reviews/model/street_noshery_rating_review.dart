import 'dart:convert';

class StreetNosheryShopRating {
  final int? shopId;
  final int? totalRating;
  final int? ratingCount;
  final double? averageRating;

  StreetNosheryShopRating({
    this.shopId,
    this.totalRating,
    this.ratingCount,
    this.averageRating,
  });

  factory StreetNosheryShopRating.fromJson(Map<String, dynamic> json) {
    return StreetNosheryShopRating(
      shopId: json['shopId'] as int?,
      totalRating: json['totalRating'] as int?,
      ratingCount: json['ratingCount'] as int?,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shopId': shopId,
      'totalRating': totalRating,
      'ratingCount': ratingCount,
      'averageRating': averageRating,
    };
  }
}

StreetNosheryShopRating? shopRatingFromJson(String str) {
  if (str.isEmpty) return null;
  return StreetNosheryShopRating.fromJson(json.decode(str));
}

String shopRatingToJson(StreetNosheryShopRating? data) {
  if (data == null) return '{}';
  return json.encode(data.toJson());
}