import 'dart:io';

import 'package:bio_creative/src/consts/builder_ids.dart';
import 'package:bio_creative/src/models/gender_model.dart';
import 'package:bio_creative/src/models/profile_model.dart';
import 'package:bio_creative/src/models/social_media_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController {
  final _box = GetStorage();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final profile = ProfileModel().obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  void getProfile() {
    _users
        .where('email', isEqualTo: email)
        .limit(1)
        .get(const GetOptions(source: Source.serverAndCache))
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        profile(
          ProfileModel(
              id: doc.id,
              email: doc.get('email'),
              birthDate: DateTime.tryParse(doc.get('birthdate')),
              firstName: doc.get('first_name'),
              lastName: doc.get('last_name'),
              gender: doc.get('gender') == 1
                  ? GenderModel(id: 1, label: 'Male')
                  : GenderModel(id: 2, label: 'Female'),
              image: doc.get('image') == '' ? null : doc.get('image'),
              socialMedia: SocialMediaModel(
                  facebook:
                      doc.get('facebook') == '' ? null : doc.get('facebook'),
                  instagram:
                      doc.get('instagram') == '' ? null : doc.get('instagram'),
                  tiktok: doc.get('tiktok') == '' ? null : doc.get('tiktok'))),
        );
        update([BuilderIds.profileId]);
      }
    });
  }

  void doUploadImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowCompression: true,
        allowedExtensions: [
          'jpeg',
          'jpg',
          'png',
        ],
        type: FileType.custom,
        dialogTitle: 'Pick File Image to Upload',
      );

      if (result != null) {
        File file = File(result.files.single.path.toString());
        firebase_storage.TaskSnapshot task = await firebase_storage
            .FirebaseStorage.instance
            .ref('images/$email/' + path.basename(file.path))
            .putFile(file);

        String linkUrl = await task.ref.getDownloadURL();

        _users.doc(profile.value.id).update({
          'image': linkUrl,
        }).then((value) {
          Get.snackbar('Info', 'Uploading Image Success');
          getProfile();
        });

        update([BuilderIds.profileId]);
      }
    } on FirebaseException catch (e) {
      Get.snackbar('Info', e.toString());
    } on Exception catch (e) {
      Get.snackbar('Info', e.toString());
    }
  }

  void openFacebook() async {
    if (profile.value.socialMedia?.facebook != null) {
      String url = 'https://facebook.com/' +
          profile.value.socialMedia!.facebook.toString();
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        Get.snackbar('Info', 'Could not open facebook');
      }
    }
  }

  void openInstagram() async {
    if (profile.value.socialMedia?.facebook != null) {
      String url = 'https://instagram.com/' +
          profile.value.socialMedia!.instagram.toString();
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        Get.snackbar('Info', 'Could not open instagram');
      }
    }
  }

  void openTiktok() async {
    if (profile.value.socialMedia?.tiktok != null) {
      String url =
          'https://tiktok.com/' + profile.value.socialMedia!.tiktok.toString();
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        Get.snackbar('Info', 'Could not open tiktok');
      }
    }
  }

  void doLogout() {
    _box.remove('email');
    Get.offAllNamed('/');
  }

  String get email => _box.read('email');
}
