import 'dart:convert';

class StreetNosheryReviewmodel {
   String? id;
   String? customerId;
   int? shopId;
   String? createdAt;
   String? updatedAt;
   int? rating;
   String? reviews;

  StreetNosheryReviewmodel({
     this.id,
     this.customerId,
     this.shopId,
     this.createdAt,
     this.updatedAt,
    this.rating,
    this.reviews,
  });

  factory StreetNosheryReviewmodel.fromJson(Map<String, dynamic> json) {
    return StreetNosheryReviewmodel(
      id: json['_id'] ?? '',
      customerId: json['customerId'] ?? '',
      shopId: json['shopId'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      rating: json['rating'] is int ? json['rating'] : null,
      reviews: json['reviews'] is String ? json['reviews'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'customerId': customerId,
      'shopId': shopId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'rating': rating,
      'reviews': reviews,
    };
  }
}

StreetNosheryReviewmodel shopFromJson(String str) => StreetNosheryReviewmodel.fromJson(json.decode(str));
String shopToJson(StreetNosheryReviewmodel data) => json.encode(data.toJson());
