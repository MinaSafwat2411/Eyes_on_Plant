import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../routes.dart';
import 'cubit/splash/splash_cubit.dart';
import 'cubit/splash/splash_states.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit,SplashStates>(
      builder: (context, state) => const Scaffold(
        backgroundColor: AppColors.japaneseLaurel,
        body: Center(
          child: Image(
            image: AssetImage('assets/images/app_logo.png'),
            height: 200,
            width: 200,
          ),
        ),
      ),
      listener: (context, state) {
        switch(state){
          case OnNavigateToChooseWay() : context.replace(AppRoutePaths.chooseWay);
          case OnNavigateToOnboarding() : context.replace(AppRoutePaths.onboarding);
          case OnNavigateToHome(): context.replace(AppRoutePaths.layout);
        }
      },
      listenWhen: (previous, current) => previous is InitialState,
    );
  }
}
