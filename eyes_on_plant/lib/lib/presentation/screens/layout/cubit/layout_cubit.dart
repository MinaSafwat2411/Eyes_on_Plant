import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repositories/auth_repository.dart';
import '../states/layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  static LayoutCubit get(context) => BlocProvider.of(context);

  LayoutCubit() : super(InitialState());
  var authRepository = AuthRepository();

  var currentIndex = 0;

  var pageController = PageController();

  var titles = [
    "Hi plant lover !",
    "Diseases and pests",
    "My Garden",
    "Settings",
  ];

  void onBottomNavChange(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    emit(OnScreenChange());
  }

  void onValueChange(int value) {
    currentIndex = value;
    emit(OnScreenChange());
  }
  void logout(){
    emit(OnLoading());
    try{
      authRepository.logout();
      emit(OnSuccess());
    }catch(e){
      emit(OnError());
    }
  }
}
