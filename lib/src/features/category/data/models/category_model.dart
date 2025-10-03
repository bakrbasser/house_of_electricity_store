import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.iconUrl,
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.parentId,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    imageUrl: json['image_url'],
    parentId: json['parent_id'],
    iconUrl: json['icon_url'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'image_url': imageUrl,
    'parent_id': parentId,
    'icon_url': iconUrl,
  };
}
