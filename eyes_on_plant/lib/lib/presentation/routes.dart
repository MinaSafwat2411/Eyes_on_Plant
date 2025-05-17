import 'package:eyes_on_plant/lib/data/models/vegetables/vegetables_model.dart';
import 'package:eyes_on_plant/lib/presentation/screens/fruitdetails/fruits_details_screen.dart';
import 'package:eyes_on_plant/lib/presentation/screens/fruits/fruits_screen.dart';
import 'package:eyes_on_plant/lib/presentation/screens/layout/layout_screen.dart';
import 'package:eyes_on_plant/lib/presentation/screens/login/login_screen.dart';
import 'package:eyes_on_plant/lib/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:eyes_on_plant/lib/presentation/screens/search/search_screen.dart';
import 'package:eyes_on_plant/lib/presentation/screens/splash/splash_screen.dart';
import 'package:eyes_on_plant/lib/presentation/screens/vegetables/vegetables_screen.dart';
import 'package:eyes_on_plant/lib/presentation/screens/vegetablesdetails/vegetables_details_screen.dart';
import 'package:go_router/go_router.dart';

import '../data/models/fruits/fruits_model.dart';

enum AppRoutes {
  chooseWay,
  splash,
  layout,
  onboarding,
  vegetables,
  vegetablesDetails,
  fruits,
  fruitsDetails,
  search,
}

final GoRouter router = GoRouter(
  initialLocation: AppRoutePaths.splash,  // Define initial route
  routes: [
    GoRoute(path: AppRoutePaths.chooseWay, name: AppRoutes.chooseWay.name, builder: (context, state) => const LoginScreen()),
    GoRoute(path: AppRoutePaths.splash, name: AppRoutes.splash.name, builder: (context, state) => const SplashScreen()),
    GoRoute(path: AppRoutePaths.layout, name: AppRoutes.layout.name, builder: (context, state) => const LayoutScreen()),
    GoRoute(path: AppRoutePaths.onboarding, name: AppRoutes.onboarding.name, builder: (context, state) => const OnboardingScreen()),
    GoRoute(path: AppRoutePaths.vegetables,name: AppRoutes.vegetables.name,builder: (context, state) => const VegetablesScreen()),
    GoRoute(path: AppRoutePaths.fruits,name: AppRoutes.fruits.name,builder: (context, state) => const FruitsScreen()),
    GoRoute(path: AppRoutePaths.search,name: AppRoutes.search.name,builder: (context, state) => const SearchScreen()),
    GoRoute(path: AppRoutePaths.vegetablesDetails,name: AppRoutes.vegetablesDetails.name,builder: (context, state) => VegetablesDetailsScreen(vegetable: state.extra as VegetablesModel,)),
    GoRoute(path: AppRoutePaths.fruitsDetails,name: AppRoutes.fruitsDetails.name,builder: (context, state) =>  FruitsDetailsScreen(fruits: state.extra as FruitsModel,)),
  ],
);

abstract class AppRoutePaths {
  static const String chooseWay = '/choose-way';
  static const String splash = '/splash';
  static const String layout = '/layout';
  static const String onboarding = '/onboarding';
  static const String vegetables ='/vegetables';
  static const String vegetablesDetails ='/vegetables-details';
  static const String fruits ='/fruits';
  static const String fruitsDetails ='/fruits-details';
  static const String search = '/search';
}
