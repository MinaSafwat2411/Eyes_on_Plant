
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomBottomSheet extends StatelessWidget {

  const CustomBottomSheet({
    super.key,
    required this.widget,
});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color:AppColors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Container(
                width: 115,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.gray20,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              widget
            ],
          ),
        );
      }
    );
  }
}
