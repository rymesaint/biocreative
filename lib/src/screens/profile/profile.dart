import 'package:bio_creative/src/consts/builder_ids.dart';
import 'package:bio_creative/src/controllers/profile_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as provider;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      id: BuilderIds.profileId,
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            'BioCreative.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () => _.doLogout(),
              icon: const Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ),
            )
          ],
        ),
        bottomSheet: BottomSheet(
          onClosing: () => print('ok'),
          builder: (context) {
            return Container(
              height: Get.height * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(
                          'My Profile',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        ListTile(
                          title: const Text('E-mail'),
                          subtitle: Text(_.profile.value.email ?? '-'),
                        ),
                        ListTile(
                          title: const Text('First Name'),
                          subtitle: Text(_.profile.value.firstName ?? '-'),
                        ),
                        ListTile(
                          title: const Text('Last Name'),
                          subtitle: Text(_.profile.value.lastName ?? '-'),
                        ),
                        ListTile(
                          title: const Text('Birthdate'),
                          subtitle: Text(_.profile.value.birthDate == null
                              ? '-'
                              : DateFormat('dd MMM yyyy').format(
                                  _.profile.value.birthDate as DateTime)),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: Get.width,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/undraw_social_media.svg',
                                height: 64,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Social Media',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          onTap: () => _.openFacebook(),
                          title: const Text('Facebook'),
                          subtitle: Text(
                              _.profile.value.socialMedia?.facebook ?? '-'),
                          trailing: const Icon(Icons.link),
                        ),
                        ListTile(
                          onTap: () => _.openInstagram(),
                          title: const Text('Instagram'),
                          subtitle: Text(
                              _.profile.value.socialMedia?.instagram ?? '-'),
                          trailing: const Icon(Icons.link),
                        ),
                        ListTile(
                          onTap: () => _.openTiktok(),
                          title: const Text('Tiktok'),
                          subtitle:
                              Text(_.profile.value.socialMedia?.tiktok ?? '-'),
                          trailing: const Icon(Icons.link),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          enableDrag: false,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 1,
        ),
        body: SafeArea(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Container(
                      height: 120.w,
                      width: 120.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: _.profile.value.image != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                  _.profile.value.image.toString(),
                                ),
                              )
                            : const DecorationImage(
                                image: provider.Svg(
                                    'assets/images/undraw_profile_pic.svg')),
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          child: IconButton(
                            onPressed: () => _.doUploadImage(),
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ),
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
