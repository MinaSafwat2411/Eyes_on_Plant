import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/onboardingItem.dart';
import '../../../core/widgets/onboarding_bottom_section.dart';
import '../../routes.dart';
import 'cubit/onboarding/onboarding_cubit.dart';
import 'cubit/onboarding/onboarding_states.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = OnboardingCubit.get(context);

    return BlocConsumer<OnboardingCubit, OnboardingStates>(
      listener: (context, state) {
        if (state is OnNavigate) {
          context.replace(AppRoutePaths.chooseWay);
        }
      },
        buildWhen: (previous, current) => current is OnLastScreen || current is OnChangeScreen,
      builder: (context, state)  {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 200,),
                Expanded(
                  child: PageView(
                    controller:cubit.pageController,
                    children: const [
                      OnboardingItem(
                        title: 'Welcome to Eyes on plant',
                        description: 'Join us to discover more about plants.',
                        image: 'assets/images/onboarding_1.png',
                      ),
                      OnboardingItem(
                        title: 'Scan your plant with us',
                        description:
                            'Find out more about your plant and what it is suffering from.',
                        image: 'assets/images/onboarding_2.png',
                      ),
                      OnboardingItem(
                        title: 'Discover more with us',
                        description:
                            'Increase your knowledge and awareness of plants with us.',
                        image: 'assets/images/onboarding_3.png',
                      ),
                    ],
                    onPageChanged: (value) {
                      cubit.currentScreen = value;
                      cubit.onValueChange();
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SmoothPageIndicator(
                  controller: cubit.pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 12,
                    dotHeight: 12,
                    activeDotColor: AppColors.apple,
                    dotColor: AppColors.sisal,
                    radius: 12,
                    expansionFactor: 1.01,
                    spacing: 5,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                OnboardingBottomSection(
                  btnText: cubit.currentScreen == 2? 'Get Started' : 'Next',
                  isLast: cubit.currentScreen == 2,
                  next: () {
                    cubit.onButtonClicked();
                  },
                  skip: () {
                    cubit.onSkip();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
