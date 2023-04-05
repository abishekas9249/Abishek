class ProductModel {
  final String url;
  final String productName;
  final double cost;
  final int discount;
  final String uid;
  final String sellerName;
  final String sellerid;
  final int rating;
  final int noOfRating;

  ProductModel({
    required this.url,
    required this.productName,
    required this.discount,
    required this.uid,
    required this.sellerName,
    required this.sellerid,
    required this.rating,
    required this.noOfRating,
    required this.cost,
  });
}
