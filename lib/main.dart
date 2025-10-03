import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_electricity/src/app_theme.dart';
import 'package:house_of_electricity/src/core/app/di.dart';
import 'package:house_of_electricity/src/features/cart_items/presentation/cubit/cubit/cart_items_operations_cubit.dart';
import 'package:house_of_electricity/src/features/favorites/presentation/cubit/favorites_operations/favorites_operations_cubit.dart';
import 'package:house_of_electricity/src/routing.dart';
import 'package:house_of_electricity/src/core/app/initialize_supabase.dart';

void main() async {
  await initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.get<CartItemsOperationsCubit>()),
        BlocProvider(create: (context) => di.get<FavoritesOperationsCubit>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        routerConfig: router,
      ),
    );
  }
}
