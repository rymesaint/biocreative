import 'package:bio_creative/src/consts/builder_ids.dart';
import 'package:bio_creative/src/consts/keys.dart';
import 'package:bio_creative/src/models/gender_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class RegisterController extends GetxController {
  final _box = GetStorage();
  final registerKey = GlobalKey<FormState>(debugLabel: Keys.registerKey);
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final genders = <GenderModel>[
    GenderModel(id: 1, label: 'Male'),
    GenderModel(id: 2, label: 'Female'),
  ];
  final genderSelected = GenderModel().obs;
  final birthDate = DateTime.now().obs;
  final birthDateText = TextEditingController();
  final emailTaken = false.obs;
  final facebook = TextEditingController();
  final instagram = TextEditingController();
  final tiktok = TextEditingController();

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  @override
  void onInit() {
    super.onInit();
    debounce(emailTaken, (_) => checkEmailDuplicate(email.text),
        time: const Duration(seconds: 1), onDone: () {
      registerKey.currentState!.validate();
    });
  }

  String? validEmail(String? value) {
    if (value!.isEmpty) {
      return 'E-mail is required.';
    }

    if (!value.isEmail) {
      return 'E-mail is not valid';
    }

    if (emailTaken.value == true) {
      return 'E-mail has been already registered.';
    }

    return null;
  }

  String? validName(String? value) {
    if (value!.isEmpty) {
      return 'First Name is required.';
    }

    return null;
  }

  String? sexValid(dynamic value) {
    if (value == null) {
      return 'Sex is required.';
    }

    return null;
  }

  String? birthValid(String? value) {
    if (value!.isEmpty) {
      return 'Birthdate is required.';
    }
    return null;
  }

  void changeGender(GenderModel? gender) {
    genderSelected(gender);
    update([BuilderIds.registerId]);
  }

  void checkEmailDuplicate(String? email) async {
    if (email!.isNotEmpty) {
      QuerySnapshot checkDuplicateEmail =
          await users.where('email', isEqualTo: email).limit(1).get();

      if (checkDuplicateEmail.size >= 1) {
        emailTaken(true);
      } else {
        emailTaken(false);
      }
    }
    update([BuilderIds.registerId]);
  }

  void changeBirthDate(BuildContext context) async {
    DateTime? birthSelected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 50)),
      lastDate: DateTime.now(),
    );

    if (birthSelected != null) {
      birthDate(birthSelected);
      birthDateText.text = DateFormat('dd MMM yyyy').format(birthSelected);
    }
    update([BuilderIds.registerId]);
  }

  void doSave() async {
    if (registerKey.currentState!.validate()) {
      users.add({
        'email': email.text,
        'first_name': firstName.text,
        'last_name': lastName.text,
        'gender': genderSelected.value.id,
        'birthdate': DateFormat('yyyy-MM-dd').format(birthDate.value),
        'image': '',
        'tiktok': tiktok.text,
        'facebook': facebook.text,
        'instagram': instagram.text,
      }).then((value) async {
        await _box.write('email', email.text);
        Get.offAllNamed('/profile');
        // ignore: invalid_return_type_for_catch_error
      }).catchError((error) => Get.snackbar('Info', error));
    }
  }
}
