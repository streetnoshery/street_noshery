class FavouriteFood {
  String? image;
  String? itemName;
  int? price;
  num? rating;
  num? dishId;
  String? dateTime;
  num? dishCount;

  FavouriteFood({this.image, this.itemName, this.price, this.rating, this.dishId, this.dateTime, this.dishCount});
}

class PastOrderDetailsResponse {
  String title;
  int rating;
  String? price;

  PastOrderDetailsResponse({required this.title, required this.rating, this.price});
}