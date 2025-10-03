import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.createdAt,
    required super.categoryId,
    required super.isDiscounted,
    required super.imageUrl,
    required super.isAvailable,
    required super.quantity,
  });
  factory ProductModel.fromEntity(Product product) => ProductModel(
    id: product.id,
    name: product.name,
    description: product.description,
    price: product.price,
    createdAt: product.createdAt,
    categoryId: product.categoryId,
    isDiscounted: product.isDiscounted,
    imageUrl: product.imageUrl,
    isAvailable: product.isAvailable,
    quantity: product.quantity,
  );
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'],
    name: json['name'],
    description: json['description'] ?? 'no description',
    price: toDouble(json['price'])!,
    createdAt: DateTime.parse(json['created_at']),
    categoryId: json['category_id'],
    isDiscounted: json['is_discounted'],
    imageUrl: json['image_url'] ?? 'images/no_image_available.png',
    isAvailable: json['is_available'],
    quantity: json['quantity'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'created_at': createdAt.toIso8601String(),
    'category_id': categoryId,
    'is_discounted': isDiscounted,
    'image_url': imageUrl,
    'is_available': isAvailable,
    'quantity': quantity,
  };
}
