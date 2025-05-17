import 'package:eyes_on_plant/lib/presentation/routes.dart';
import 'package:eyes_on_plant/lib/presentation/screens/fruits/cubit/fruits_cubit.dart';
import 'package:eyes_on_plant/lib/presentation/screens/layout/cubit/layout_cubit.dart';
import 'package:eyes_on_plant/lib/presentation/screens/login/cubit/login/login_cubit.dart';
import 'package:eyes_on_plant/lib/presentation/screens/onboarding/cubit/onboarding/onboarding_cubit.dart';
import 'package:eyes_on_plant/lib/presentation/screens/splash/cubit/splash/splash_cubit.dart';
import 'package:eyes_on_plant/lib/presentation/screens/vegetables/cubit/vegetables_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'lib/data/services/bloc_observer.dart';
import 'lib/data/services/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.saveData(key: 'isDark', value: true);
  bool isDark = await CacheHelper.getData(key: 'isDark') ?? false;
  String lang = await CacheHelper.getData(key: 'lang') ?? 'en';
  runApp(MyApp(isDark: isDark, lang: lang,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isDark, required this.lang});

  final bool isDark;
  final String lang;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SplashCubit()),
          BlocProvider(create: (context) => OnboardingCubit()),
          BlocProvider(create: (context) => LoginCubit(),),
          BlocProvider(create: (context) => LayoutCubit(),),
          BlocProvider(create: (context) => FruitsCubit(),),
          BlocProvider(create: (context) => VegetablesCubit(),),
        ],
        child: MaterialApp.router(
          title: 'Eyes on Plant',
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        )
    );
  }
}


