class ProductModel {
  final String id;
  final String storeId;
  final String name;
  final String description;
  final List<String> images;
  final double price;
  final int sales;
  final int reviewers;
  bool isFavorite;
  int amount;
  final double rating;

  ProductModel({
    required this.id,
    required this.storeId,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.sales,
    required this.reviewers,
    required this.isFavorite,
    required this.amount,
    required this.rating,
  });
}
