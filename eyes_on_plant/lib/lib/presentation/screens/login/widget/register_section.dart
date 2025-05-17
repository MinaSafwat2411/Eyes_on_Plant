import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../cubit/login/login_cubit.dart';

class RegisterSection extends StatelessWidget {
  const RegisterSection({super.key,required this.onLogin});

  final GestureTapCallback onLogin;

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min, // ✅ Changed to "min" to avoid height issues
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          const Text(
            'Sign up',
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
                        'Name',
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
                            controller: cubit.nameController,
                            decoration: InputDecoration(
                              hintText: 'Type your Name',
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
                        'Email',
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
                            validator: (value) {
                              if (value!.isEmpty){
                                return 'Email must not be empty';
                              }else if(!value.contains('@')&&!value.contains('.com')){
                                return 'Email must be valid';
                              }else{
                                return null;
                              }
                            },
                            controller: cubit.emailController,
                            decoration: InputDecoration(
                              hintText: 'Type your Email',
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
                        'phone',
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
                            validator:(value) {
                              if(value!.length < 11){
                                return 'Phone must be at least 11 characters';
                              }else{
                                return null;
                              }
                            },
                            controller: cubit.phoneController,
                            decoration: InputDecoration(
                              hintText: 'Type your Phone',
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
                        'Create password',
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
                            validator: (value) {
                              if(value!.length < 6){
                                return 'Password must be at least 6 characters';
                              }else{
                                return null;
                              }
                            },
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
                      const Text(
                        'Confirm password',
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
                            validator: (value) {
                              if (value != cubit.passwordController.text){
                                return 'Password not match';
                              }else{
                                return null;
                              }
                            },
                            controller: cubit.confirmPasswordController,
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

                    ],
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if(cubit.formKey.currentState!.validate()) {
                cubit.onRegisterUser();
              }
            },
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.apple)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Sign up',
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
                  'Already have an account ?',
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
                onTap: (){
                  onLogin();
                } ,
                child: const Text(
                  'Login',
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
      ),
    );
  }
}
