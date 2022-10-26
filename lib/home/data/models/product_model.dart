

import 'package:products_task/home/domain/entities/product.dart';

class ProductModel extends Product {

  const ProductModel({
  required super.id,
  required super.title,
  required super.description,
  required super.price,
  required super.discountPercentage,
  required super.rating,
  required super.stock,
  required super.brand,
  required super.category,
  required super.thumbnail,
  required super.images,
});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
          id: json['id'],
          title: json['title'],
          description: json['description'],
          price: json['price'].toDouble(),
          discountPercentage: json['discountPercentage'].toDouble(),
          rating: json['rating'].toDouble(),
          stock: json['stock'],
          brand: json['brand'],
          category: json['category'],
          thumbnail: json['thumbnail'],
          images: List.from(json["images"]),
      );
}