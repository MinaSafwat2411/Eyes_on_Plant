import 'package:flutter/material.dart';

import '../../../../../data/models/auth/auth_model.dart';
import '../../../../../data/models/user/user_model.dart';
import '../../../../../data/repositories/auth_repository.dart';
import '../../../../../data/repositories/user_repository.dart';
import 'login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialState()) {
    emit(OnChooseWay());
  }

  static LoginCubit get(context) => BlocProvider.of(context);

  var authRepository = AuthRepository();
  var userRepository = UserRepository();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void onLogin() {
    emit(OnLogin());
  }

  void onRegister() {
    emit(OnRegister());
  }

  void onLoginUser() async{
    try {
      emit(LoadingState());
      await authRepository.login(
        AuthModel(
          email: emailController.text,
          password: passwordController.text,
        )
      );
      emailController.clear();
      passwordController.clear();
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState());
    }
  }

  void onRegisterUser() async{
    try {
      emit(LoadingState());
      var result = await authRepository.register(
        AuthModel(
          email: emailController.text,
          password: passwordController.text,
        )
      );
      await userRepository.addUserData(
        UserModel(
          uid: result,
          name: nameController.text,
          phone: phoneController.text,
          email: emailController.text,
        )
      );
      nameController.clear();
      phoneController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState());
    }
  }
}
