import 'dart:async';

import 'package:eyes_on_plant/lib/presentation/screens/splash/cubit/splash/splash_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/services/cache_helper.dart';

class SplashCubit extends Cubit<SplashStates>{
  SplashCubit() : super(InitialState()){
    onNavigate();
  }
  static SplashCubit get(context) => BlocProvider.of(context);

  var isOpened = CacheHelper.getData(key: 'isOpened') ?? false;
  var uid = CacheHelper.getData(key: 'uid') ?? '';

  void onNavigate(){
    Timer(const Duration(seconds: 4),(){
      if(isOpened){
        if(uid.isEmpty){
          emit(OnNavigateToChooseWay());
        }else{
          emit(OnNavigateToHome());
        }
      }else{
        emit(OnNavigateToOnboarding());
      }
    });
  }
}