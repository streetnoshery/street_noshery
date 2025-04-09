import 'package:dart_mappable/dart_mappable.dart';

part 'street_noshery_rating_review.mapper.dart';

@MappableClass()
class StreetNosheryShopRating with StreetNosheryShopRatingMappable {
  final int? shopId;
  final int? totalRating;
  final int? ratingCount;
  final double? averageRating;

  const StreetNosheryShopRating({
    this.shopId,
    this.totalRating,
    this.ratingCount,
    this.averageRating,
  });
}