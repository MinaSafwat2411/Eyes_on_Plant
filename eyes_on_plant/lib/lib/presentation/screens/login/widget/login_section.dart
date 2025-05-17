import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

import '../cubit/login/login_cubit.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key,required this.onSign});
  final GestureTapCallback onSign;
  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return Column(
      mainAxisSize: MainAxisSize.min, // ✅ Changed to "min" to avoid height issues
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        const Text(
          'Log in',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.japaneseLaurel,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email address',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.japaneseLaurel10,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: cubit.emailController,
                          decoration: InputDecoration(
                            hintText: 'Type your email',
                            floatingLabelStyle: const TextStyle(
                              color: AppColors.gray,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: AppColors.alto),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: AppColors.japaneseLaurel
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: AppColors.red
                              ),
                            ),
                          ),
                          autofocus: false,
                          maxLines: 1, // ✅ Removed "expands" to avoid layout conflicts
                          cursorColor: AppColors.trinidadColor,
                        ),
                      ),
                    ),
                    const Text(
                      'password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.japaneseLaurel10,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: cubit.passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            floatingLabelStyle: const TextStyle(
                              color: AppColors.gray,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: AppColors.alto),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: AppColors.japaneseLaurel
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: AppColors.red
                              ),
                            ),
                          ),
                          autofocus: false,
                          maxLines: 1, // ✅ Removed "expands" to avoid layout conflicts
                          cursorColor: AppColors.trinidadColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            cubit.onLoginUser();
          },
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.apple)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Log in',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.alabaster,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don\'t have an account ? ',
            textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.naturalGray,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
            )
            ),
            const SizedBox(width: 16,),
            GestureDetector(
              onTap: onSign ,
              child: const Text(
                'Sign up .',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.apple,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 30,)
      ],
    );
  }
}
