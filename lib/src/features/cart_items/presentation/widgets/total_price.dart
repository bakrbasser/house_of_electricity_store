import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/cubit/cart_items_cubit.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final stream = context.read<CartItemsCubit>().totalPriceStream;
    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Row(
          children: [
            Text('السعر الكلي :', style: IBMMedium()),
            Spacer(),
            StreamBuilder(
              stream: stream.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    '${snapshot.data!.toStringAsFixed(1)}\$',
                    style: IBMMedium(),
                  );
                } else {
                  return Text('0', style: IBMMedium());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
