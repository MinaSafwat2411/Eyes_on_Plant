import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class ChooseWaySection extends StatelessWidget {
  const ChooseWaySection({super.key,required this.onLogin,required this.onSignUp});
  final GestureTapCallback onLogin;
  final GestureTapCallback onSignUp;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 24,
        ),
        const Text(
          'Your first time ?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.japaneseLaurel,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        GestureDetector(
          onTap: onSignUp,
          child: Container(
            decoration: ShapeDecoration(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: AppColors.japaneseLaurel,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 96.0, vertical: 8),
              child: Text(
                'Sign up ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.japaneseLaurel,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Or',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.naturalGray,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 1,
            letterSpacing: -0.32,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: onLogin,
          child: Container(
            decoration: ShapeDecoration(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: AppColors.japaneseLaurel,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 106, vertical: 8),
              child: Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.japaneseLaurel,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 240,
        ),
      ],
    );
  }
}
