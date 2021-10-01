import 'package:bio_creative/src/models/gender_model.dart';

import 'social_media_model.dart';

class ProfileModel {
  String? id;
  String? email;
  DateTime? birthDate;
  GenderModel? gender;
  String? firstName;
  String? lastName;
  String? image;
  SocialMediaModel? socialMedia;

  ProfileModel({
    this.id,
    this.email,
    this.birthDate,
    this.firstName,
    this.gender,
    this.lastName,
    this.image,
    this.socialMedia,
  });
}
