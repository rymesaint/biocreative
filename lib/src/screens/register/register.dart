import 'package:bio_creative/src/consts/builder_ids.dart';
import 'package:bio_creative/src/controllers/register_controller.dart';
import 'package:bio_creative/src/models/gender_model.dart';
import 'package:bio_creative/src/shared_components/custom_dropdown.dart';
import 'package:bio_creative/src/shared_components/custom_textform.dart';
import 'package:bio_creative/src/shared_components/title_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      id: BuilderIds.registerId,
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Get Started'),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _.registerKey,
              autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const TitleComponent(
                      title: 'Your Personal Information',
                      description: 'Please fill all asterisk (*) column below.',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextForm(
                      controller: _.email,
                      validator: (String? value) => _.validEmail(value),
                      label: 'E-mail address *',
                      onChanged: (value) => _.checkEmailDuplicate(value),
                    ),
                    CustomTextForm(
                      controller: _.firstName,
                      label: 'First Name *',
                      validator: (String? value) => _.validName(value),
                    ),
                    CustomTextForm(
                      controller: _.lastName,
                      label: 'Last Name',
                    ),
                    CustomDropdown(
                      label: 'Sex*',
                      validator: (value) => _.sexValid(value),
                      items: _.genders
                          .map((e) => DropdownMenuItem<GenderModel>(
                                child: Text(e.label ?? '?'),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (gender) => _.changeGender(gender),
                    ),
                    CustomTextForm(
                      validator: (value) => _.birthValid(value),
                      controller: _.birthDateText,
                      label: 'Birth Date*',
                      readOnly: true,
                      onTap: () => _.changeBirthDate(context),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TitleComponent(title: 'Social Media'),
                    CustomTextForm(
                      controller: _.facebook,
                      label: 'Facebook Username',
                      hintText: 'username',
                    ),
                    CustomTextForm(
                      controller: _.instagram,
                      label: 'Instagram Username',
                      hintText: 'username',
                    ),
                    CustomTextForm(
                      controller: _.tiktok,
                      label: 'Tiktok Username',
                      hintText: '@username',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: Get.width,
                      height: 40.h,
                      child: ElevatedButton(
                        onPressed: () => _.doSave(),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
