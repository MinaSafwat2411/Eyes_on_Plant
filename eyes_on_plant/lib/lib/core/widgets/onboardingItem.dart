import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const SizedBox(
          height: 45,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.japaneseLaurel,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.naturalGray,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
