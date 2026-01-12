import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/search/presentation/cubit/query_products_cubit.dart';
import 'package:house_of_electricity/src/features/search/presentation/widgets/search_cotroller.dart';

enum SearchFieldType { home, regular }

InputBorder appFieldBorder({Color? color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(RadiusV.v24),
    borderSide: BorderSide(color: color ?? Colors.black, width: 2),
  );
}

InputDecoration appFieldDecoration({
  String? hint,
  Widget? prefixIcon,
  Widget? suffixIcon,
}) {
  final border = appFieldBorder(color: AppColors.grey);
  return InputDecoration(
    suffixIconColor: AppColors.darkerGrey,
    hintStyle: IBMMedium(color: AppColors.darkerGrey, fontSize: Sizes.s16),
    border: border,
    enabledBorder: border,
    focusedBorder: border,
    hintText: hint,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    contentPadding: EdgeInsets.symmetric(horizontal: Spacing.small),
  );
}

class SearchProductField extends StatefulWidget {
  const SearchProductField({super.key, required this.searchFieldType});

  final SearchFieldType searchFieldType;

  @override
  State<SearchProductField> createState() => _SearchProductFieldState();
}

class _SearchProductFieldState extends State<SearchProductField> {
  @override
  void initState() {
    super.initState();
  }

  void search() {
    if (searchController.text.isEmpty) {
      return;
    }
    if (widget.searchFieldType == SearchFieldType.home) {
      context.push('/home/search/${searchController.text}');
    } else {
      context.read<QueryProductsCubit>().queryByName();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: IBMMedium(color: AppColors.darkerGrey, fontSize: Sizes.s16),
      onSubmitted: (value) {
        search();
      },
      controller: searchController,
      decoration: appFieldDecoration(
        hint: 'ابحث هنا...',
        suffixIcon: IconButton(onPressed: search, icon: Icon(Icons.search)),
      ),
    );
  }
}
