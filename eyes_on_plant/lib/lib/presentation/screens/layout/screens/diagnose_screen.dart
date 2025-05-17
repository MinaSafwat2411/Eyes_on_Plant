
import 'package:eyes_on_plant/lib/core/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DiagnoseScreen extends StatelessWidget {
  const DiagnoseScreen({super.key});
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
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Common problems',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.japaneseLaurel,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async=> launchGoogleLink("https://extension.colostate.edu/topic-areas/yard-garden/powdery-mildews-2-902/#:~:text=on%20plant%20parts.-,Powdery%20mildews%20are%20characterized%20by%20spots%20or%20patches%20of%20white,overwintering%20bodies%20of%20the%20fungus") ,
                child: Stack(
                  alignment:Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 150,
                      height: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/ic_diagnose1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Powdery mildew',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFFAFAFA),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async=> launchGoogleLink("https://en.wikipedia.org/wiki/Downy_mildew") ,
                child: Stack(
                  alignment:Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 150,
                      height: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/ic_diagnose2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Downy Mildew',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFFAFAFA),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async=> launchGoogleLink("https://en.wikipedia.org/wiki/Leaf_spot#:~:text=A%20leaf%20spot%20is%20a,of%20necrosis%20(cell%20death)") ,
                child: Stack(
                  alignment:Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 150,
                      height: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/ic_diagnose3.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Leaf spots',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFFAFAFA),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async=> launchGoogleLink("https://en.wikipedia.org/wiki/Blight") ,
                child: Stack(
                  alignment:Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 150,
                      height: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/ic_diagnose4.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Blight',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFFAFAFA),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
