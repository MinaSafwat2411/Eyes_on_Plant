import 'package:eyes_on_plant/lib/presentation/screens/login/widget/choose_way_section.dart';
import 'package:eyes_on_plant/lib/presentation/screens/login/widget/login_section.dart';
import 'package:eyes_on_plant/lib/presentation/screens/login/widget/register_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/custom_bottom_sheet.dart';
import '../../routes.dart';
import 'cubit/login/login_cubit.dart';
import 'cubit/login/login_states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return  BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        switch (state) {
          case LoadingState(): break;
          case SuccessState(): context.replace(AppRoutePaths.layout);
        }
      },
      buildWhen: (previous, current) => current is! InitialState,
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
        body: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image(image: AssetImage('assets/images/login_background.png'),height: 620,fit: BoxFit.fitWidth,width: double.infinity,),
                        SizedBox()
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(),
                        if(state is OnChooseWay)CustomBottomSheet(widget: ChooseWaySection(
                          onLogin: () {
                            cubit.onLogin();
                          },
                          onSignUp: () {
                            cubit.onRegister();
                          },
                        ))
                        else if(state is !OnRegister)CustomBottomSheet(widget: LoginSection(
                          onSign: () {
                            cubit.onRegister();
                          },
                        ))
                        else if(state is !OnLogin)CustomBottomSheet(widget: RegisterSection(
                            onLogin: (){
                              cubit.onLogin();
                            },
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      },
    );
  }
}
