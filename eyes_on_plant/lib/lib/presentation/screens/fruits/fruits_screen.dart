import 'package:eyes_on_plant/lib/core/utils/app_colors.dart';
import 'package:eyes_on_plant/lib/presentation/screens/fruits/cubit/fruits_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/custom_loading.dart';
import '../../routes.dart';
import 'cubit/fruits_states.dart';

class FruitsScreen extends StatelessWidget {
  const FruitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FruitsCubit>(context);
    return BlocConsumer<FruitsCubit, FruitsStates>(
      builder:
          (context, state) => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Fruits',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.japaneseLaurel,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back),
                iconSize: 18,
                padding: EdgeInsets.zero,
                // Remove extra padding if needed
                constraints: const BoxConstraints(minWidth: 25, minHeight: 25),
              ),
            ),
            body: state is OnLoading ? CustomLoading() :Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListView.separated(
                    itemBuilder:
                        (context, index) => GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoutes.fruitsDetails.name,extra: cubit.fruits[index]);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  height: 70,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
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
                                  child: Text(
                                    cubit.fruits[index].name ?? "",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF42B53F),
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 1,
                                      letterSpacing: -0.32,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 69,
                                    height: 70,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          cubit.fruits[index].image ?? "",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
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
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          blurRadius: 4,
                                          offset: Offset(0, 0),
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: AppColors.japaneseLaurel,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: cubit.fruits.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                  ),
                ],
              ),
            ),
          ),
      listener: (context, state) {},
      buildWhen: (previous, current) => current is! InitialState,
    );
  }
}
