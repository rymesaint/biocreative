import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'BioCreative.',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontFamily: GoogleFonts.aBeeZee().fontFamily,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200.h,
                  child:
                      SvgPicture.asset('assets/images/undraw_social_bio.svg'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BottomSheet(
        enableDrag: false,
        onClosing: () => print('ok'),
        builder: (context) => Container(
          height: 340.h,
          width: Get.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(80),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(5, 0),
                blurRadius: 1,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Biography?',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'A biography is a written essay about the life of an individual. Its usually more than 1000 words and includes information such as background information and major achievements.',
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'To get your awesome biography tap Get Started and fill a few column.',
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: InkWell(
                    onTap: () => Get.toNamed('/register'),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      width: 180.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextButton(
                    onPressed: () => Get.toNamed('/login'),
                    child: const Text('Already have an account?'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
