import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/dialogs.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';
import 'package:house_of_electricity/src/features/cart_items/domain/entities/cart_product.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/cubit/cart_items_cubit.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/widgets/cart_item_box.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartProducts});
  final List<CartProduct> cartProducts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartProducts.length,
      itemBuilder: (context, index) => Dismissible(
        key: Key(cartProducts[index].id.toString()),
        onDismissed: (direction) {
          context.read<CartItemsCubit>().removeFromCart(cartProducts[index]);
        },
        child: CartItemBoxLayout(cartProduct: cartProducts[index]),
      ),
    );
  }
}

class CartItemsReactiveList extends StatefulWidget {
  const CartItemsReactiveList({super.key});

  @override
  State<CartItemsReactiveList> createState() => _CartItemsReactiveListState();
}

class _CartItemsReactiveListState extends State<CartItemsReactiveList> {
  void call() => context.read<CartItemsCubit>().fetchCartItems();

  @override
  void initState() {
    super.initState();
    call();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartItemsCubit, CartItemsState>(
      listener: (context, state) {
        if (state is CartItemsFailed) {
          showAlertDialog(context, state.message, onOk: call);
        }
      },
      child: BlocBuilder<CartItemsCubit, CartItemsState>(
        builder: (context, state) {
          if (state is CartItemsHasData) {
            return CartItemsList(cartProducts: state.cartProducts);
          } else if (state is CartItemsLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.mainGreen),
            );
          } else if (state is CartItemsEmpty) {
            return _NoAvailableCartProducts();
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}

class _NoAvailableCartProducts extends StatelessWidget {
  const _NoAvailableCartProducts();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'لا يوجد منتجات مضافة الى عربة التسوق يرجى اضافة بعض المنتجات',
        style: IBMBold(fontSize: Sizes.s24),
      ),
    );
  }
}
