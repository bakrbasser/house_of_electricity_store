import 'package:flutter/material.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';
import 'package:house_of_electricity/src/core/presentation/screen_size_helper.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/core/presentation/supabase_image_helper.dart';
import 'package:house_of_electricity/src/features/category/domain/entities/category.dart';
import 'package:house_of_electricity/src/features/category/presentation/widgets/category_tile.dart';

class CategoryCircularBox extends StatelessWidget {
  const CategoryCircularBox({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidthPercentage(context, 20),
      child: Column(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              elevation: 2,
              shadowColor: Colors.black,
              backgroundColor: AppColors.lightGrey,
              fixedSize: Size.fromRadius(screenWidthPercentage(context, 6)),
            ),
            onPressed: () {
              goToCategoryProductsList(context, category.id);
            },
            icon: CategoryIcon(iconUrl: category.iconUrl),
          ),
          SizedBox(height: Spacing.small),
          Text(
            category.name,
            textAlign: TextAlign.center,
            style: IBMRegular(fontSize: Sizes.s16),
          ),
        ],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    super.key,
    required this.iconUrl,
    this.color = AppColors.darkGreen,
  });

  final String iconUrl;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: IconCategoryHelper.instance.getImage(path: iconUrl, color: color),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          return snapshot.data!;
        }
        return Icon(Icons.house, color: color);
      },
    );
  }
}
