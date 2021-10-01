import 'package:bio_creative/src/consts/builder_ids.dart';
import 'package:bio_creative/src/controllers/login_controller.dart';
import 'package:bio_creative/src/shared_components/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: BuilderIds.loginId,
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Log In'),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _.loginKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Please log in to continue'),
                const SizedBox(
                  height: 20,
                ),
                CustomTextForm(
                  controller: _.email,
                  label: 'E-mail address',
                  validator: (value) => _.validEmail(value),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 40.h,
                    child: ElevatedButton.icon(
                      onPressed: () => _.checkEmail(),
                      label: const Text('Log In'),
                      icon: const Icon(Icons.login_rounded),
                    ),
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
