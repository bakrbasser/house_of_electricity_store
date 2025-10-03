import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';

enum FiltrationTypes {
  nameAsc('حسب الاسم تصاعديا'),
  nameDesc('حسب الاسم تنازليا'),
  priceAsc('حسب السعر تصاعديا'),
  priceDesc('حسب السعر تنازليا');

  const FiltrationTypes(this.nameInArabic);
  final String nameInArabic;
}

List<Product> sortProducts(FiltrationTypes type, List<Product> products) {
  switch (type) {
    case FiltrationTypes.priceAsc:
      products.sort((a, b) {
        return a.price.compareTo(b.price);
      });
      break;
    case FiltrationTypes.priceDesc:
      products.sort((a, b) {
        return b.price.compareTo(a.price);
      });
      break;
    case FiltrationTypes.nameAsc:
      products.sort((a, b) {
        return a.name.compareTo(b.name);
      });
      break;
    case FiltrationTypes.nameDesc:
      products.sort((a, b) {
        return b.name.compareTo(a.name);
      });
      break;
  }
  return products;
}
