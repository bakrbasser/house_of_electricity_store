import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/category/domain/entities/category.dart';
import 'package:house_of_electricity/src/features/category/presentation/widgets/category_box.dart';

class CategoryRectangularBox extends StatefulWidget {
  const CategoryRectangularBox({
    super.key,
    required this.category,
    required this.subCategories,
  });
  final Category category;
  final List<Category>? subCategories;

  @override
  State<CategoryRectangularBox> createState() => _CategoryRectangularBoxState();
}

class _CategoryRectangularBoxState extends State<CategoryRectangularBox> {
  Widget leading = Icon(Icons.keyboard_double_arrow_down_sharp);

  void expand(bool val) {
    setState(() {
      if (val) {
        leading = Icon(Icons.keyboard_double_arrow_up_sharp);
      } else {
        leading = Icon(Icons.keyboard_double_arrow_down_sharp);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: false,
      leading: leading,
      onExpansionChanged: expand,
      title: Text(widget.category.name, style: IBMBold()),
      trailing: CategoryIcon(
        iconUrl: widget.category.iconUrl,
        color: Colors.black,
      ),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(RadiusV.v4),
        side: BorderSide(color: AppColors.grey),
      ),
      childrenPadding: EdgeInsets.symmetric(horizontal: Spacing.tiny),
      children: widget.subCategories == null
          ? []
          : widget.subCategories!
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: Spacing.small),
                    child: SubCategoriesTile(subCategory: e),
                  ),
                )
                .toList(),
    );
  }
}

class SubCategoriesTile extends StatelessWidget {
  const SubCategoriesTile({super.key, required this.subCategory});

  final Category subCategory;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        goToCategoryProductsList(context, subCategory.id);
      },
      title: Text(subCategory.name, style: IBMBold()),
      trailing: CategoryIcon(iconUrl: subCategory.iconUrl, color: Colors.black),
      tileColor: AppColors.lightGrey,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(RadiusV.v4),
        side: BorderSide(color: Colors.transparent),
      ),
    );
  }
}

void goToCategoryProductsList(BuildContext context, int categoryId) {
  context.push('/categories/search/$categoryId');
}
