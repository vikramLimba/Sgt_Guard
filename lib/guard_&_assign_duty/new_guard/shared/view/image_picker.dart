import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/shared/controller/image_picker_controller.dart';
import 'package:form_login/shared/widgets/custom_bottomsheet.dart';
import 'package:form_login/styles/colors.dart';
import 'package:form_login/styles/font_style.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProfileImage extends StatelessWidget {
  const AddProfileImage({
    super.key,
    required this.imgController,
  });

  final ImagePickerController imgController;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Obx(() => CircleAvatar(
            backgroundColor: AppColors.lightPrimaryColor,
            radius: 35.r,
            child: CircleAvatar(
              radius: 35.r,
              backgroundColor: AppColors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35.r),
                    child: imgController.selectedImagePath.value == ""
                        ? Icon(
                            Icons.account_circle,
                            size: 72.w,
                            color: AppColors.primaryColor,
                          )
                        // Image.asset(
                        //     "assets/splash_1.png",
                        //     fit: BoxFit.fill,
                        //     width: 70.w,
                        //     height: 70.h,
                        //   )
                        : Image.file(
                            File(imgController.selectedImagePath.value),
                            fit: BoxFit.fill,
                            width: 70.w,
                            height: 70.h,
                          ),
                  ),
                ],
              ),
            ),
          )),
      Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet<int>(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return AppBottomSheet(
                    child: Container(
                      color: AppColors.white,
                      child: Column(children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            imgController.getImage(ImageSource.camera);
                          },
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                              height: 48.h,
                              width: Get.width - 80.w,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.grayColor,
                                    width: 1.w,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Take Photo',
                                    style: AppFontStyle.regularTextStyle(
                                        AppColors.textColor, 14.sp),
                                  ),
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    color: AppColors.primaryColor,
                                    size: 22.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            imgController.getImage(ImageSource.gallery);
                          },
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                              height: 48.h,
                              width: Get.width - 80.w,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.grayColor,
                                    width: 1.w,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Choose Photo',
                                    style: AppFontStyle.regularTextStyle(
                                        AppColors.textColor, 14.sp),
                                  ),
                                  Icon(
                                    Icons.photo_library_outlined,
                                    // FontAwesome5.images,
                                    color: AppColors.primaryColor,
                                    size: 22.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (imgController.selectedImagePath.value != "")
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              Get.dialog(
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 32.h),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.r),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Material(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Are you sure you want to delete this profile picture ?",
                                                  textAlign: TextAlign.center,
                                                  style: AppFontStyle
                                                      .mediumTextStyle(
                                                          AppColors.textColor,
                                                          14.sp),
                                                ),
                                                SizedBox(height: 20.h),
                                                //Buttons
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                minimumSize:
                                                                    Size(0,
                                                                        35.h),
                                                                backgroundColor:
                                                                    AppColors
                                                                        .white,
                                                                foregroundColor:
                                                                    AppColors
                                                                        .primaryColor,
                                                                textStyle: AppFontStyle
                                                                    .semiboldTextStyle(
                                                                        AppColors
                                                                            .primaryColor,
                                                                        16.sp),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6.r),
                                                                  side:
                                                                      BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    width:
                                                                        1.0.w,
                                                                  ),
                                                                )),
                                                        onPressed: () {
                                                          imgController
                                                              .selectedImagePath
                                                              .value = "";
                                                          Get.back();
                                                        },
                                                        child: const Text(
                                                          'Delete',
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10.w),
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          minimumSize:
                                                              Size(0, 35.h),
                                                          backgroundColor:
                                                              AppColors
                                                                  .primaryColor,
                                                          textStyle: AppFontStyle
                                                              .semiboldTextStyle(
                                                                  AppColors
                                                                      .white,
                                                                  16.sp),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.r),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: const Text(
                                                          'Cancel',
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Center(
                              child: Container(
                                padding:
                                    EdgeInsets.only(top: 15.h, bottom: 16.h),
                                height: 48.h,
                                width: Get.width - 80.w,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColors.grayColor,
                                      width: 1.w,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Delete Photo',
                                      style: AppFontStyle.regularTextStyle(
                                          AppColors.textColor, 14.sp),
                                    ),
                                    Icon(
                                      Icons.delete_outline,
                                      color: AppColors.primaryColor,
                                      size: 26.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                            height: 48.h,
                            width: Get.width - 80.w,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.grayColor,
                                  width: 1.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                },
              );
            },
            child: Container(
              height: 24.h,
              width: 24.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFFCBCBCB),
                  width: 1.0,
                ),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.camera_alt_outlined,
                // Typicons.camera_outline,
                color: AppColors.primaryColor,
                size: 14.w,
              ),
            ),
          )),
    ]);
  }
}
