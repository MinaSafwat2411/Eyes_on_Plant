import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_bottom_sheet.dart';
import '../cubit/layout_cubit.dart';
import '../states/layout_states.dart';

class MyGardenScreen extends StatelessWidget {
  const MyGardenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LayoutCubit>();
    return BlocConsumer<LayoutCubit, LayoutStates>(
      builder:
          (context, state) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomBottomSheet(
                              widget: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(child: Row(
                                      children: [
                                        Icon(Icons.camera_alt,color:  AppColors.japaneseLaurel,),
                                        SizedBox(width: 10,),
                                        Text("Take Image From Camera",style: TextStyle(
                                          color:  AppColors.japaneseLaurel
                                        ),),
                                      ],
                                    ),onPressed: () =>cubit.onTakePhotoBuyCamera(0)
                                      ,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(child: Row(
                                      children: [
                                        Icon(Icons.image,color:  AppColors.japaneseLaurel),
                                        SizedBox(width: 10,),
                                        Text("Upload Image From Gallery",style: TextStyle(
                                            color:  AppColors.japaneseLaurel
                                        ),),
                                      ],
                                    ),onPressed: ()=> cubit.onTakePhotoBuyCamera(1)
                                      ,),
                                  ),
                                ],
                              )
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.sisal,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child:
                          cubit.image == null
                              ? Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera),
                                  SizedBox(width: 5),
                                  Text(
                                    "Open the camera",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(12), // ← حدد الحجم اللي يناسبك
                            child: Image.file(
                              cubit.image,
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                          )
            
                          ),
                    ),
                  if(cubit.predictions.prediction3 != null) Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            Icon(Icons.class_outlined,color: AppColors.japaneseLaurel),
                            SizedBox(width: 8,),
                            Text(
                              'Class Name',
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
                        SizedBox(height: 16,),
                        Text(
                          cubit.predictions.prediction1?.className??"",
                          style: TextStyle(
                            color: const Color(0xFF3C3D37),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            height: 1.40,
                            letterSpacing: 0.14,
                          ),
                        ),
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            Icon(Icons.percent,color: AppColors.japaneseLaurel),
                            SizedBox(width: 8,),
                            Text(
                              'Confidence',
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
                        SizedBox(height: 16,),
                        Text(
                          cubit.predictions.prediction1?.confidence??"",
                          style: TextStyle(
                            color: const Color(0xFF3C3D37),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            height: 1.40,
                            letterSpacing: 0.14,
                          ),
                        ),
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            Icon(Icons.description,color: AppColors.japaneseLaurel),
                            SizedBox(width: 8,),
                            Text(
                              'Description',
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
                        SizedBox(height: 16,),
                        Text(
                          cubit.predictions.prediction1?.description??"",
                          style: TextStyle(
                            color: const Color(0xFF3C3D37),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            height: 1.40,
                            letterSpacing: 0.14,
                          ),
                        ),
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            Icon(Icons.image,color: AppColors.japaneseLaurel),
                            SizedBox(width: 8,),
                            Text(
                              'Example Image',
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
                        SizedBox(height: 16,),
                        Text(
                          cubit.predictions.prediction1?.examplePicture??"",
                          style: TextStyle(
                            color: const Color(0xFF3C3D37),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            height: 1.40,
                            letterSpacing: 0.14,
                          ),
                        ),
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            Icon(Icons.back_hand_sharp,color: AppColors.japaneseLaurel),
                            SizedBox(width: 8,),
                            Text(
                              'Prevention',
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
                        SizedBox(height: 16,),
                        Text(
                          cubit.predictions.prediction1?.prevention??"",
                          style: TextStyle(
                            color: const Color(0xFF3C3D37),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            height: 1.40,
                            letterSpacing: 0.14,
                          ),
                        ),
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            Icon(Icons.hail_outlined,color: AppColors.japaneseLaurel),
                            SizedBox(width: 8,),
                            Text(
                              'Treatment',
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
                        SizedBox(height: 16,),
                        Text(
                          cubit.predictions.prediction1?.treatment??"",
                          style: TextStyle(
                            color: const Color(0xFF3C3D37),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            height: 1.40,
                            letterSpacing: 0.14,
                          ),
                        ),
                        SizedBox(height: 16,),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
      listener: (context, state) {
        if(state is OnLoading){
          context.pop();
        }
      },
    );
  }
}
