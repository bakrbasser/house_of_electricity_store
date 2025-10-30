class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final DateTime createdAt;
  final int categoryId;
  final bool isDiscounted;
  final String? imageUrl;
  final bool isAvailable;
  final int quantity;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.createdAt,
    required this.categoryId,
    required this.isDiscounted,
    required this.imageUrl,
    required this.isAvailable,
    required this.quantity,
  });
}
