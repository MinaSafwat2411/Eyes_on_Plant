import 'package:eyes_on_plant/lib/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          context.pop();
        }, icon: Image.asset('assets/images/ic_back.png')),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SearchBar(
              backgroundColor: WidgetStatePropertyAll(AppColors.white,),
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.search,color: AppColors.naturalGray,),
              ),
              hintText: 'Search',
            ),
          )
        ],
      ),
    );
  }
}
