import 'package:bio_creative/src/screens/get_started/get_started.dart';
import 'package:bio_creative/src/screens/login/login.dart';
import 'package:bio_creative/src/screens/onboarding/onboarding.dart';
import 'package:bio_creative/src/screens/profile/profile.dart';
import 'package:bio_creative/src/screens/register/register.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CustomRoute {
  static List<GetPage> pages = [
    GetPage(
        name: '/',
        page: () {
          final _box = GetStorage();

          if (!_box.hasData('skip_onboarding')) {
            return Onboarding();
          } else {
            if (_box.hasData('email')) {
              return const Profile();
            } else {
              return const GetStarted();
            }
          }
        }),
    GetPage(name: '/get-started', page: () => const GetStarted()),
    GetPage(name: '/login', page: () => const Login()),
    GetPage(name: '/profile', page: () => const Profile()),
    GetPage(name: '/register', page: () => const Register()),
  ];
}
