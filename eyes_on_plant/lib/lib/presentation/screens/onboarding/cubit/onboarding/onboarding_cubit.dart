import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/services/cache_helper.dart';
import 'onboarding_states.dart';


class OnboardingCubit  extends Cubit<OnboardingStates>{
  OnboardingCubit(): super (InitialState());

  static OnboardingCubit get(context)=> BlocProvider.of(context);

  var pageController =PageController();
  var currentScreen = 0;

  void onButtonClicked(){
    currentScreen = pageController.page?.toInt()?? 0;
    if(state is OnLastScreen){
      CacheHelper.saveData(key: 'isOpened', value: true);
      emit(OnNavigate());
    }
    if(currentScreen == 2){
      emit(OnLastScreen());
    }else {
      emit(OnChangeScreen());
    }
    emit(OnChangeScreen());
    pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }
  void onSkip(){
    CacheHelper.saveData(key: 'isOpened', value: true);
    emit(OnNavigate());
  }
  void onValueChange(){
    if(currentScreen == 2){
      emit(OnLastScreen());
    }else {
      emit(OnChangeScreen());
    }
  }
}