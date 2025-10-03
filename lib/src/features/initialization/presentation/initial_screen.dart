import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/assets_manager.dart';
import 'package:house_of_electricity/src/core/presentation/dialogs.dart';
import 'package:house_of_electricity/src/core/presentation/screen_size_helper.dart';
import 'package:house_of_electricity/src/features/initialization/presentation/cubit/initializer_cubit.dart';
import 'package:house_of_electricity/src/routing.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    context.read<InitializerCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitializerCubit, InitializerState>(
      listener: (context, state) {
        if (state is InitializationFailed) {
          showAlertDialog(
            context,
            state.message,
            okMessage: 'اعادة المحاولة',
            onOk: () {
              context.read<InitializerCubit>().init();
            },
          );
        } else if (state is Initialized) {
          context.go(Pages.home.path);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: screenHeightPercentage(context, 40)),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1.5),
                duration: Duration(seconds: 1),
                builder: (context, value, child) =>
                    Transform.scale(scale: value, child: child),
                child: Image.asset(AssetsManager.logo),
              ),
              Spacer(),
              CircularProgressIndicator(color: AppColors.mainYellow),
              SizedBox(height: screenHeightPercentage(context, 5)),
            ],
          ),
        ),
      ),
    );
  }
}
