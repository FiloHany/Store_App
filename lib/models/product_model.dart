class ProductModel {
  // Use types that match the fakestoreapi response
  final dynamic id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(dynamic jsonData) {
    // Defensive parsing: handle ints/doubles and missing fields
    final id = jsonData['id'] is int ? jsonData['id'] as int : int.tryParse('${jsonData['id']}') ?? 0;
    final title = jsonData['title']?.toString() ?? '';
    final price = (jsonData['price'] is num) ? (jsonData['price'] as num).toDouble() : double.tryParse('${jsonData['price']}') ?? 0.0;
    final description = jsonData['description']?.toString() ?? '';
    final category = jsonData['category']?.toString() ?? '';
    final image = jsonData['image']?.toString() ?? '';
    final rating = jsonData['rating'] != null ? RatingModel.fromJson(jsonData['rating']) : RatingModel(rate: 0.0, count: 0);

    return ProductModel(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rating: rating,
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(dynamic jsonData) {
    final rate = (jsonData['rate'] is num) ? (jsonData['rate'] as num).toDouble() : double.tryParse('${jsonData['rate']}') ?? 0.0;
    final count = jsonData['count'] is int ? jsonData['count'] as int : int.tryParse('${jsonData['count']}') ?? 0;
    return RatingModel(rate: rate, count: count);
  }
}