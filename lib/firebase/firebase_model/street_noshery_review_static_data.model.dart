class StreetNosheryReviewFirebaseModel {
  final String? reviewPrefilled;
  final String? secondaryCta;
  final String? ratings;
  final String? review;
  final String? primaryCta;
  final String? title;

  StreetNosheryReviewFirebaseModel({
    this.reviewPrefilled,
    this.secondaryCta,
    this.ratings,
    this.review,
    this.primaryCta,
    this.title,
  });

  factory StreetNosheryReviewFirebaseModel.fromJson(Map<String, dynamic> json) {
    return StreetNosheryReviewFirebaseModel(
      reviewPrefilled: json['reviewPrefilled'] as String?,
      secondaryCta: json['secondaryCta'] as String?,
      ratings: json['ratings'] as String?,
      review: json['review'] as String?,
      primaryCta: json['primaryCta'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reviewPrefilled': reviewPrefilled,
      'secondaryCta': secondaryCta,
      'ratings': ratings,
      'review': review,
      'primaryCta': primaryCta,
      'title': title,
    };
  }
}
