import 'package:flutter/material.dart';

import '../cubit/layout_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Account',
            style: TextStyle(
              color: const Color(0xFF3C3D37),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              cubit.logout();
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 275,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFDFDFD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 16,
                        top: 7,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 16,
                          children: [
                            Container(
                              width: 26,
                              height: 25,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFDFDFD),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 0),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 6,
                                    top: 5,
                                    child: Container(
                                      width: 15,
                                      height: 15,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Icon(Icons.logout,size: 15,),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Log in / Sign Up',
                              style: TextStyle(
                                color: const Color(0xFF3C3D37),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 181,
                        top: 15,
                        child: SizedBox(width: 10, height: 10),
                      ),
                      Positioned(
                        left: 259,
                        top: 15,
                        child: Container(
                          transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                          height: 10,
                          child: Stack(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
