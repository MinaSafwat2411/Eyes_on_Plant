import 'package:eyes_on_plant/lib/data/models/fruits/fruits_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_colors.dart';

class FruitsDetailsScreen extends StatelessWidget {
  const FruitsDetailsScreen({super.key,required this.fruits});
  final FruitsModel fruits;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 286,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(fruits.image??""),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 30),
                  child: IconButton(onPressed: () {
                    context.pop();
                  }, icon: Image.asset("assets/images/ic_back.png",width: 30,height: 30,)),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Text(
              fruits.name??"",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.japaneseLaurel,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/ic_overview.png",width: 24,height: 24,),
                      SizedBox(width: 8,),
                      Text(
                        'Plant overview',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.japaneseLaurel,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    fruits.overview??"",
                    style: TextStyle(
                      color: const Color(0xFF3C3D37),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 1.40,
                      letterSpacing: 0.14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.japaneseLaurel,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/ic_water.png",width: 24,height: 24,),
                      SizedBox(width: 8,),
                      Text(
                        'Water',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.japaneseLaurel,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    fruits.growingConditions?.watering??"",
                    style: TextStyle(
                      color: const Color(0xFF3C3D37),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 1.40,
                      letterSpacing: 0.14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.japaneseLaurel,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/ic_sunlight.png",width: 24,height: 24,),
                      SizedBox(width: 8,),
                      Text(
                        'Sunlight',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.japaneseLaurel,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    fruits.growingConditions?.sunlight??"",
                    style: TextStyle(
                      color: const Color(0xFF3C3D37),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 1.40,
                      letterSpacing: 0.14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.japaneseLaurel,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/ic_soil.png",width: 24,height: 24,),
                      SizedBox(width: 8,),
                      Text(
                        'Soil',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.japaneseLaurel,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    fruits.growingConditions?.soil??"",
                    style: TextStyle(
                      color: const Color(0xFF3C3D37),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 1.40,
                      letterSpacing: 0.14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.japaneseLaurel,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/ic_temperature.png",width: 24,height: 24,),
                      SizedBox(width: 8,),
                      Text(
                        'Temperature',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.japaneseLaurel,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    fruits.growingConditions?.temperature??"",
                    style: TextStyle(
                      color: const Color(0xFF3C3D37),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 1.40,
                      letterSpacing: 0.14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.japaneseLaurel,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/ic_how_to_grow.png",width: 24,height: 24,),
                      SizedBox(width: 8,),
                      Text(
                        'Growing Season',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.japaneseLaurel,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    fruits.growingConditions?.growingSeason??"",
                    style: TextStyle(
                      color: const Color(0xFF3C3D37),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 1.40,
                      letterSpacing: 0.14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.japaneseLaurel,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/ic_fun_fact.png",width: 24,height: 24,),
                      SizedBox(width: 8,),
                      Text(
                        'Planting Tips',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.japaneseLaurel,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    fruits.growingConditions?.plantingTips??"",
                    style: TextStyle(
                      color: const Color(0xFF3C3D37),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 1.40,
                      letterSpacing: 0.14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.japaneseLaurel,
                    ),
                  ),
                  Text(
                    'Characteristics',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.japaneseLaurel,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: 16,),
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder.all(width: 1,borderRadius: BorderRadius.circular(8),
                        color: AppColors.japaneseLaurel),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("Fruit",style: TextStyle(
                            color: const Color(0xB2148E08) /* 3RD */,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),),
                        ),
                        Text("Color & Shape",style: TextStyle(
                          color: const Color(0xB2148E08) /* 3RD */,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),),
                        Text("Flavor",style: TextStyle(
                          color: const Color(0xB2148E08) /* 3RD */,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),),
                        Text("Flowers",style: TextStyle(
                          color: const Color(0xB2148E08) /* 3RD */,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),),
                      ]),
                      TableRow(children: [
                        Text(
                          fruits.characteristics?.fruit??"",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF3C3D37),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                        Text(
                          fruits.characteristics?.colorShape??"",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF3C3D37),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                        Text(
                          fruits.characteristics?.flavor??"",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF3C3D37),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                        Text(
                          fruits.characteristics?.flowers??"",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF3C3D37),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("Plant",style: TextStyle(
                            color: const Color(0xB2148E08) /* 3RD */,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),),
                        ),
                        Text("Size",style: TextStyle(
                          color: const Color(0xB2148E08) /* 3RD */,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),),
                        Text("Foliage",style: TextStyle(
                          color: const Color(0xB2148E08) /* 3RD */,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),),
                        Text("Varieties",style: TextStyle(
                          color: const Color(0xB2148E08) /* 3RD */,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),),
                      ]),
                      TableRow(children: [
                        Text(
                          fruits.characteristics?.plant??"",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF3C3D37),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                        Text(
                          fruits.characteristics?.size??"",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF3C3D37),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                        Text(
                          fruits.characteristics?.foliage??"",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF3C3D37),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                        Text(
                          fruits.characteristics?.varieties??"",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF3C3D37),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                      ]),

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
