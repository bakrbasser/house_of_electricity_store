class Category {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final String iconUrl;
  final int? parentId;

  const Category({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.parentId,
    required this.iconUrl,
  });
}
