import 'dart:io';
import 'package:fertie_app/utils/app_icons.dart';
import 'package:fertie_app/views/base/custom_list_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:fertie_app/utils/app_colors.dart';
import 'package:fertie_app/utils/style.dart';
import 'package:fertie_app/views/base/custom_text.dart';
import 'package:fertie_app/views/screen/bottomMenuBar/user_bottom_menu..dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Uint8List? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: UserBottomMenu(2),
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Profile picture
                    _image != null
                        ? Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Container(
                          width: 150.w,
                          height: 150.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1.w, color: AppColors.white),
                              image: DecorationImage(
                                  image: MemoryImage(_image!),
                                  fit: BoxFit.cover))),
                    )
                        : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150.w,
                        height: 150.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.r)),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            'http://www.clker.com/cliparts/Z/J/g/U/V/b/avatar-male-silhouette-md.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          showImagePickerOption(context);
                        },
                        child: Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(25.r)),
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 25,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Mahafujer', style: AppStyles.fontSize20(fontWeight: FontWeight.w900)),
                  Text('Age : 25', style: AppStyles.fontSize16(color: AppColors.subTextColor)),
                  Text('Account type : Free', style: AppStyles.fontSize16(color: AppColors.subTextColor)),
                ],
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.colorF7D6D1,
                  borderRadius: BorderRadius.all(Radius.circular(16.r)),
                ),
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.h),
                  child: Column(
                    children: [
                      CustomListTile(
                        prefixIcon: SvgPicture.asset(AppIcons.personalInfoIcon),
                        suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                        onTap: (){},
                        title: 'Personal Information'),
                      CustomListTile(
                          prefixIcon: SvgPicture.asset(AppIcons.updateAccountIcon),
                          suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                          onTap: (){},
                          title: 'Upgrade Account Type'),

                      CustomListTile(
                          prefixIcon: SvgPicture.asset(AppIcons.loveIcon),
                          suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                          onTap: (){},
                          title: 'Period and Cycle settings'),

                      CustomListTile(
                          prefixIcon: SvgPicture.asset(AppIcons.pinChnageIcon),
                          suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                          onTap: (){},
                          title: 'Change Access PIN Settings'),
                      CustomListTile(
                          prefixIcon: SvgPicture.asset(AppIcons.passwordIcon),
                          suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                          onTap: (){},
                          title: 'Change Password'),

                      CustomListTile(
                          prefixIcon: SvgPicture.asset(AppIcons.helpIcon),
                          suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                          onTap: (){},
                          title: 'Help'),
                      CustomListTile(
                          prefixIcon: SvgPicture.asset(AppIcons.logoutIcon),
                          onTap: (){},
                          title: 'Log Out'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Show image picker options (Gallery or Camera)
  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4.2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 50.w,
                            color: AppColors.primaryColor,
                          ),
                          CustomText(text: 'Gallery')
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera();
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(Icons.camera_alt,
                              size: 50.w, color: AppColors.primaryColor),
                          CustomText(text: 'Camera')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Pick image from gallery
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Get.back();
  }

  // Pick image from camera
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Get.back();
  }
}
