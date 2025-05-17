import 'package:eyes_on_plant/lib/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.japaneseLaurel,
          strokeWidth: 1,
        ),
      ),
    );
  }
}
