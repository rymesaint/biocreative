import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Onboarding extends StatelessWidget {
  final _box = GetStorage();
  Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                isRepeatingAnimation: true,
                displayFullTextOnTap: false,
                onNext: (int index, bool animate) async {
                  if (index == 3 && animate == true) {
                    await _box.write('skip_onboarding', true);
                    Get.toNamed('/get-started');
                  }
                },
                animatedTexts: [
                  TyperAnimatedText(
                    'Bio',
                    textStyle: TextStyle(
                      fontSize: 50.sp,
                      color: Colors.white,
                    ),
                    curve: Curves.decelerate,
                    speed: const Duration(milliseconds: 100),
                  ),
                  TyperAnimatedText(
                    'Creative',
                    textStyle: TextStyle(
                      fontSize: 50.sp,
                      color: Colors.white,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                  FadeAnimatedText(
                    'BioCreative.',
                    textStyle: TextStyle(
                      fontSize: 50.sp,
                      color: Colors.white,
                    ),
                  ),
                  FadeAnimatedText(
                    'Welcome',
                    textStyle: TextStyle(
                      fontSize: 50.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
