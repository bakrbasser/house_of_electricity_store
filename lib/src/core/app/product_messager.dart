import 'package:house_of_electricity/src/features/product/domain/entities/product.dart';

String productShareMessage(Product product) {
  return '''
          رقم المنتج : ${product.id}
          المنتج : ${product.name}
          السعر : ${product.price} دولار
          الوصف : ${product.description}
          رابط الصورة : ${product.imageUrl ?? 'لا يوجد صورة'}
''';
}
