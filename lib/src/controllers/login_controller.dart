import 'package:bio_creative/src/consts/keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final _box = GetStorage();
  final loginKey = GlobalKey<FormState>(debugLabel: Keys.loginKey);
  final email = TextEditingController();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  String? validEmail(String? value) {
    if (value!.isEmpty) {
      return 'E-mail is required.';
    }

    if (!value.isEmail) {
      return 'E-mail is not valid';
    }

    return null;
  }

  void checkEmail() async {
    if (loginKey.currentState!.validate()) {
      QuerySnapshot checkDuplicateEmail =
          await _users.where('email', isEqualTo: email.text).limit(1).get();

      if (checkDuplicateEmail.size <= 0) {
        Get.snackbar('Info', 'Could not find any email registered.');
        return;
      }
      await _box.write('email', email.text);
      Get.offAllNamed('/profile');
    }
  }
}
