import 'package:bio_creative/src/consts/theme.dart';
import 'package:bio_creative/src/routes/route.dart';
import 'package:bio_creative/src/utils/firebase_core_loader/loading.dart';
import 'package:bio_creative/src/utils/firebase_core_loader/something_went_wrong.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const SomethingWentWrong();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: () => GetMaterialApp(
              title: 'Bio Creative',
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              getPages: CustomRoute.pages,
              theme: CustomTheme.mainTheme,
            ),
          );
        }

        return const Loading();
      },
    );
  }
}
