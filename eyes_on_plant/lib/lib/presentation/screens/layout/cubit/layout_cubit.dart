import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/models/predict/PredictModel.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../data/services/dio_helper.dart';
import '../states/layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  static LayoutCubit get(context) => BlocProvider.of(context);

  LayoutCubit() : super(InitialState());
  var authRepository = AuthRepository();

  var currentIndex = 0;
  var predictions = PredictionModel();

  var pageController = PageController();
  var image;

  var titles = [
    "Hi plant lover !",
    "Diseases and pests",
    "Scan",
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

  void onTakePhotoBuyCamera(int index)async{
    try{
      image = null;
      predictions = PredictionModel();
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.values.elementAt(index),
        imageQuality: 70,
        maxWidth: 1024,
        maxHeight: 1024,
      );
      if(pickedFile == null) return;
      emit(OnLoading());
      File imageFile = File(pickedFile.path);
      image = imageFile;
      emit(OnUploadImage());
      var response = await DioHelper.postImage(imageFile);
      predictions = PredictionModel.fromJson(response.data);
      emit(OnScanDone());
    }catch(e){
      emit(OnError());
    }
  }
}
