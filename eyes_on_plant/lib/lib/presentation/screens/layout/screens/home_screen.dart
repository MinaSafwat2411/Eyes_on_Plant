import 'package:eyes_on_plant/lib/core/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Future<void> launchGoogleLink(String link) async {
    final Uri phoneUrl = Uri.parse(link);
    try {
      await launch(phoneUrl.toString());
    } catch (e) {
      if (kDebugMode) {
        print('Error launching URL: $e');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.search.name);
              },
              child: Container(
                width: double.infinity,
                height: 45,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: AppColors.atlo,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: AppColors.japaneseLaurel),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: AppColors.naturalGray),
                      SizedBox(width: 8),
                      Text(
                        'Search ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.naturalGray,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 22),
            Text(
              'Popular plants',
              style: TextStyle(
                color: AppColors.japaneseLaurel,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoutes.vegetables.name);
                    },
                    child: Container(
                      width: 164,
                      height: 87,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: AppColors.atlo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 16,
                            top: 37,
                            child: Text(
                              'Vegetables',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.japaneseLaurel,
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1,
                                letterSpacing: -0.26,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 97,
                            top: 15,
                            child: Container(
                              width: 67,
                              height: 57,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/ic_vegetable.png",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoutes.fruits.name);
                    },
                    child: Container(
                      width: 164,
                      height: 87,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: AppColors.atlo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 16,
                            top: 37,
                            child: Text(
                              'Fruits',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.japaneseLaurel,
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1,
                                letterSpacing: -0.26,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 97,
                            top: 15,
                            child: Container(
                              width: 67,
                              height: 57,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/ic_fruits.png",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Popular Books',
              style: TextStyle(
                color: AppColors.japaneseLaurel,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: () async{
                    launchGoogleLink("https://www.blm.gov/colorado/blm-library/blm-library/recognizing-plant-families-west");
                  },
                  child: Container(
                    width: 110,
                    height: 140,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/ic_book1.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async{
                    launchGoogleLink("https://www.gutenberg.org/ebooks/68470");
                  },
                  child: Container(
                    width: 110,
                    height: 140,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/ic_book2.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async{
                    launchGoogleLink("https://www.gutenberg.org/cache/epub/58034/pg58034-images.html");
                  },
                  child: Container(
                    width: 110,
                    height: 140,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/ic_book3.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 22),
            Text(
              'Start Shopping',
              style: TextStyle(
                color: AppColors.japaneseLaurel,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async{
                    launchGoogleLink("https://hagersameh111.github.io/plants/#/Outdoor");
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 80,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/ic_shop2.png"),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Plants',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF42B53F),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async{
                    launchGoogleLink("https://hagersameh111.github.io/plants/#/Equipment");
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 80,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/ic_shop1.png"),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Tools',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF42B53F),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async{
                    launchGoogleLink("https://hagersameh111.github.io/plants/#/Fertilizers");
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 80,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/ic_shop3.png"),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Seeds',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF42B53F),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
