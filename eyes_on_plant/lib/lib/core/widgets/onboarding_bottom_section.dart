import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class OnboardingBottomSection extends StatelessWidget {
  const OnboardingBottomSection({super.key,
    required this.isLast,
    required this.btnText,
    required this.next,
    required this.skip,
  });

  final bool isLast;
  final String btnText;
  final VoidCallback next;
  final VoidCallback skip;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        if (!isLast)
    TextButton(
      onPressed: skip,

      child: const Text(
      'Skip',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.japaneseLaurel10,
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
    )),
    if (!isLast) const Spacer(),
        ElevatedButton(
          onPressed: next,
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.apple)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              btnText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.alabaster,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );
  }
}
