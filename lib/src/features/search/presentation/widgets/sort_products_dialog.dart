import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:house_of_electricity/src/core/app/sort_products_helper.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';
import 'package:house_of_electricity/src/core/presentation/screen_size_helper.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/search/presentation/cubit/query_products_cubit.dart';

class SortProductsDialog extends StatelessWidget {
  const SortProductsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        backgroundColor: AppColors.lightGrey,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(RadiusV.v12),
        ),
        child: SizedBox(
          height: screenHeightPercentage(context, 30),
          child: ListView.builder(
            itemCount: FiltrationTypes.values.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                onTap: () {
                  context.read<QueryProductsCubit>().sort(
                    FiltrationTypes.values[index],
                  );
                  context.pop();
                },
                title: Text(
                  FiltrationTypes.values[index].nameInArabic,
                  style: IBMRegular(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showSortProductsDialog(BuildContext context, QueryProductsCubit cubit) {
  showDialog(
    context: context,
    builder: (context) =>
        BlocProvider.value(value: cubit, child: SortProductsDialog()),
  );
}
