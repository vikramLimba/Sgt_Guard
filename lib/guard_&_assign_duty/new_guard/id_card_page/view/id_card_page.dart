import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/id_card_page/controller/back_image_controller.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/id_card_page/controller/front_image_controller.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/id_card_page/controller/id_card_controller.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/shared/controller/image_picker_controller.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/shared/view/image_picker.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/shared/view/new_guard_progress_bar.dart';
import 'package:form_login/shared/widgets/custom_bottomsheet.dart';
import 'package:form_login/styles/colors.dart';
import 'package:form_login/styles/font_style.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

class IdCardPage extends StatefulWidget {
  const IdCardPage({super.key});

  @override
  State<IdCardPage> createState() => _IdCardPageState();
}

class _IdCardPageState extends State<IdCardPage> {
  final idCardController = Get.put(IdCardController());
  final frontSideController = Get.put(FrontImageController());
  final backSideController = Get.put(BackImageController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
            toolbarHeight: 63.h,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 13.h,
                  ),
                  SizedBox(
                      height: 25.h,
                      child: const NewGuardProgressBar(
                        currentIndex: 2,
                      )),
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    height: 117.h,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(6.r)),
                    child: Center(
                        child: AddProfileImage(
                      imgController: ImagePickerController(),
                    )),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(6.r)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Guard Identity card",
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: AppColors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "*",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: AppColors.redColor,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ]),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Front Side",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                Obx(
                                  () => SizedBox(
                                      height: 17.h,
                                      child: frontSideController
                                                  .selectedImagePath.value !=
                                              ""
                                          ? TextButton(
                                              style: TextButton.styleFrom(
                                                  alignment: Alignment.center,
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  padding: EdgeInsets.zero),
                                              onPressed: () {
                                                frontSideController
                                                    .selectedImagePath
                                                    .value = "";
                                              },
                                              child: Text(
                                                "Remove",
                                                style: TextStyle(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ))
                                          : null),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            buildFrontSide(),
                            SizedBox(
                              height: 12.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Back Side",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                Obx(
                                  () => SizedBox(
                                      height: 17.h,
                                      child: backSideController
                                                  .selectedImagePath.value !=
                                              ""
                                          ? TextButton(
                                              style: TextButton.styleFrom(
                                                  alignment: Alignment.center,
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  padding: EdgeInsets.zero),
                                              onPressed: () {
                                                backSideController
                                                    .selectedImagePath
                                                    .value = "";
                                              },
                                              child: Text(
                                                "Remove",
                                                style: TextStyle(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ))
                                          : null),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            buildBackSide(),
                            SizedBox(
                              height: 8.h,
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                      height: 47.h,
                      width: MediaQuery.of(context).size.width,
                      child: Obx(
                        () => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r)),
                                backgroundColor: (frontSideController
                                            .selectedImagePath.value ==
                                        "")
                                    ? AppColors.disableColor
                                    : AppColors.primaryColor,
                                foregroundColor: AppColors.white),
                            onPressed:
                                frontSideController.selectedImagePath.value ==
                                            "" &&
                                        backSideController
                                                .selectedImagePath.value ==
                                            ""
                                    ? () {
                                        // idCardController.checkPassword();
                                      }
                                    : null
                            //  () {}
                            ,
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            )),
                      )),
                  SizedBox(
                    height: 33.h,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget buildFrontSide() {
    return Obx(
      () => DottedBorder(
        dashPattern: const [5, 5],
        padding: EdgeInsets.zero,
        color: frontSideController.selectedImagePath == ""
            ? AppColors.grayColor
            : AppColors.white,
        radius: Radius.circular(6.r),
        child: SizedBox(
          height: 200.h,
          child: AddFrontSide(frontImageController: frontSideController),
        ),
      ),
    );
  }

  Widget buildBackSide() {
    return Obx(
      () => DottedBorder(
        dashPattern: const [5, 5],
        padding: EdgeInsets.zero,
        color: backSideController.selectedImagePath == ""
            ? AppColors.grayColor
            : AppColors.white,
        radius: Radius.circular(6.r),
        child: SizedBox(
          height: 200.h,
          child: AddBackSide(backImageController: backSideController),
        ),
      ),
    );
  }
}

class AddFrontSide extends StatelessWidget {
  const AddFrontSide({
    super.key,
    required this.frontImageController,
  });

  final FrontImageController frontImageController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => Container(
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: frontImageController.selectedImagePath.value == ""
                ? const Image(image: AssetImage("assets/white_back1.png"))
                : ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.file(
                      File(frontImageController.selectedImagePath.value),
                      fit: BoxFit.fill,
                      width: double.maxFinite,
                      height: double.maxFinite,
                    ),
                  ),
          ),
        ),
        Center(
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
                          frontImageController.getImage(ImageSource.camera);
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          frontImageController.getImage(ImageSource.gallery);
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      if (frontImageController.selectedImagePath.value != "")
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            Get.dialog(
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 32.h),
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
                                                                  Size(0, 35.h),
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
                                                                  width: 1.0.w,
                                                                ),
                                                              )),
                                                      onPressed: () {
                                                        frontImageController
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
                                                                AppColors.white,
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
          child: frontImageController.selectedImagePath.value == ""
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        height: 22.h,
                        image: const AssetImage("assets/browse_image.png")),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      "Browse Image",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )
              : null,
        )),
      ],
    );
  }
}

class AddBackSide extends StatelessWidget {
  const AddBackSide({
    super.key,
    required this.backImageController,
  });

  // final FrontImageController frontImageController;
  final BackImageController backImageController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => Container(
            child: backImageController.selectedImagePath.value == ""
                ? const Image(image: AssetImage("assets/white_back1.png"))
                : ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.file(
                      File(backImageController.selectedImagePath.value),
                      fit: BoxFit.fill,
                      width: double.maxFinite,
                      height: double.maxFinite,
                    ),
                  ),
          ),
        ),
        Center(
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
                          backImageController.getImage(ImageSource.camera);
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          backImageController.getImage(ImageSource.gallery);
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      if (backImageController.selectedImagePath.value != "")
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            Get.dialog(
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 32.h),
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
                                                                  Size(0, 35.h),
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
                                                                  width: 1.0.w,
                                                                ),
                                                              )),
                                                      onPressed: () {
                                                        backImageController
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
                                                                AppColors.white,
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
          child: backImageController.selectedImagePath.value == ""
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        height: 22.h,
                        image: const AssetImage("assets/browse_image.png")),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      "Browse Image",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )
              : null,
        )),
      ],
    );
  }
}
