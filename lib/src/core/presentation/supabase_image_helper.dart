import 'package:flutter/widgets.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseImageHelper {
  final String bucketName;

  SupabaseImageHelper({required this.bucketName});

  Future<Widget> getImage({
    Color color = AppColors.darkGreen,
    required String path,
  });
}

class IconCategoryHelper implements SupabaseImageHelper {
  IconCategoryHelper._private();

  static IconCategoryHelper instance = IconCategoryHelper._private();

  final SupabaseStorageClient _storageClient = Supabase.instance.client.storage;

  @override
  String get bucketName => 'categories_icons';

  @override
  Future<ImageIcon> getImage({
    Color color = AppColors.darkGreen,
    required String path,
  }) async {
    final image = await _storageClient.from(bucketName).download(path);
    return ImageIcon(MemoryImage(image), color: color);
  }
}
