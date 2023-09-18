class ProductModel {
  final dynamic id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;
  ProductModel(
      {required this.rating,
      required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image});
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      rating: RatingModel.fromJson(jsonData['rating']),
      title: jsonData['title'],
      image: jsonData['image'],
      category: jsonData['category'],
      description: jsonData['description'],
      price: jsonData['price'].toString(),

      id: jsonData['id'],
    );
  }
}

class RatingModel {
  final double rate;
  final int count;
  RatingModel({required this.count, required this.rate});
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(count: jsonData['count'], rate: jsonData['rate'].toDouble());
  }
}
