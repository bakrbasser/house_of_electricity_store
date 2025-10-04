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

final List<Product> mockProducts = [
  Product(
    id: 1,
    name: 'لمبة المانية 12 فولت قابلة للطوي والتعديل المالي ',
    description: 'هاتف ذكي من آبل بمعالج A16 وشاشة ProMotion',
    price: 1199.99,
    createdAt: DateTime(2025, 8, 20),
    categoryId: 2, // الهواتف الذكية
    isDiscounted: true,
    imageUrl: 'https://example.com/images/iphone14pro.jpg',
    isAvailable: true,
    quantity: 12,
  ),
  Product(
    id: 2,
    name: 'ماك بوك إير M3',
    description: 'لابتوب خفيف بمعالج Apple Silicon M3',
    price: 1499.00,
    createdAt: DateTime(2025, 7, 15),
    categoryId: 3, // اللابتوبات
    isDiscounted: false,
    imageUrl: 'https://example.com/images/macbookairm3.jpg',
    isAvailable: true,
    quantity: 5,
  ),
  Product(
    id: 3,
    name: 'موز (1 كغ)',
    description: 'موز طازج من المزارع المحلية',
    price: 0.99,
    createdAt: DateTime(2025, 8, 30),
    categoryId: 5, // الفواكه
    isDiscounted: false,
    imageUrl: 'https://example.com/images/bananas.jpg',
    isAvailable: true,
    quantity: 50,
  ),
  Product(
    id: 4,
    name: 'سامسونج جالاكسي S23',
    description: 'هاتف أندرويد رائد بكاميرا عالية الجودة',
    price: 999.00,
    createdAt: DateTime(2025, 6, 10),
    categoryId: 2,
    isDiscounted: true,
    imageUrl: 'https://example.com/images/galaxys23.jpg',
    isAvailable: false,
    quantity: 0,
  ),
  Product(
    id: 5,
    name: 'طماطم عضوية (500 غ)',
    description: 'طماطم محلية خالية من المبيدات',
    price: 1.49,
    createdAt: DateTime(2025, 8, 28),
    categoryId: 6, // الخضروات
    isDiscounted: false,
    imageUrl: 'https://example.com/images/tomatoes.jpg',
    isAvailable: true,
    quantity: 30,
  ),
  Product(
    id: 6,
    name: 'خلاط برو 500',
    description: 'خلاط عالي السرعة للعصائر والصلصات',
    price: 89.99,
    createdAt: DateTime(2025, 5, 5),
    categoryId: 7, // الأجهزة المنزلية
    isDiscounted: true,
    imageUrl: 'https://example.com/images/blenderpro500.jpg',
    isAvailable: true,
    quantity: 8,
  ),
];
