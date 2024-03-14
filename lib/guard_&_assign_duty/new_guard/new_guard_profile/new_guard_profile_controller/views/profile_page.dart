import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/new_guard_profile/new_guard_profile_controller/controller/new_guard_profile_page_controller.dart';
import 'package:form_login/shared/widgets/custom_bottomsheet.dart';
import 'package:form_login/styles/colors.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/new_guard_profile/new_guard_profile_controller/controller/imgae_picker_controller.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/new_guard_progress_bar.dart';
import 'package:form_login/styles/font_style.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final profilePageController = Get.put(NewGuardProfilePageController());

  ImagePickerController imgController = Get.put(ImagePickerController());
  final List<String> _gender = ['Male', 'Female'];
  final List<String> _guard = ['Supervisor', 'Guard'];

  File? _myfile;
  ImagePicker picker = ImagePicker();

  Future<void> addImagefromGallary() async {
    final response = await picker.pickImage(source: ImageSource.gallery);
    if (response != null) {
      setState(() {
        _myfile = File(response.path);
      });
    } else {
      const CircularProgressIndicator();
    }
  }

  Future<void> addImagefromCamera() async {
    final response = await picker.pickImage(source: ImageSource.camera);
    if (response != null) {
      setState(() {
        _myfile = File(response.path);
      });
    } else {
      const CircularProgressIndicator();
    }
  }

  Future<void> showOption() async {
    return showModalBottomSheet(
        showDragHandle: true,
        context: context,
        builder: (context) {
          return SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                ListTile(
                  leading: IconButton(
                    onPressed: () {
                      addImagefromCamera();
                    },
                    icon: const Icon(Icons.camera_alt_outlined),
                  ),
                  title: const Text("Camera"),
                ),
                ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.photo),
                    onPressed: () {
                      addImagefromGallary();
                    },
                  ),
                  title: const Text("Gallary"),
                )
              ]),
            ),
          );
        });
  }

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
          toolbarHeight: 63,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            color: AppColors.backgroundColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 13.h,
                    ),
                    SizedBox(
                        height: 25.h,
                        child: const NewGuardProgressBar(
                          currentIndex: 0,
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
                        imgController: imgController,
                      )
                          //  buildImage(),
                          ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      // width: ,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6.r)),
                      child: Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Profile Details",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: AppColors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              fName(),
                              SizedBox(
                                height: 20.h,
                              ),
                              lName(),
                              SizedBox(
                                height: 20.h,
                              ),
                              gender(),
                              SizedBox(
                                height: 20.h,
                              ),
                              guardPosition(),
                              SizedBox(
                                height: 20.h,
                              ),
                              const DateOfBirth(),
                              SizedBox(
                                height: 20.h,
                              ),
                              mobileNumber(),
                              SizedBox(
                                height: 20.h,
                              ),
                              email()
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                        height: 47.h,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r)),
                                backgroundColor: AppColors.disableColor,
                                foregroundColor: AppColors.white),
                            onPressed: () {},
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            ))),
                    SizedBox(
                      height: 30.h,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 40.w,
              child: ClipOval(
                child: _myfile == null
                    ? Icon(
                        Icons.account_circle,
                        size: 72.h,
                      )
                    : Image.file(
                        _myfile!,
                        width: 80.w,
                        height: 70.h,
                        fit: BoxFit.cover,
                      ),
              )),
          Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                  radius: 10.h,
                  backgroundColor: Colors.white54,
                  child: InkWell(
                    onTap: () {
                      showOption();
                    },
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 12.h,
                    ),
                  )))
        ],
      ),
    );
  }

  Widget fName() {
    return SizedBox(
      height: 64.h,
      child: Form(
        key: profilePageController.fNameFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          textInputAction: TextInputAction.next,
          controller: profilePageController.fNameController,
          maxLength: 24,
          decoration: InputDecoration(
              hintText: "Enter First Name",
              hintStyle: TextStyle(
                  color: AppColors.grayColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
              label: RichText(
                  text: TextSpan(
                      text: "First Name",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                      children: const [
                    TextSpan(text: "*", style: TextStyle(color: Colors.red))
                  ])),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grayColor),
                  borderRadius: BorderRadius.circular(5.r))),
          onChanged: (value) {
            profilePageController.fName = value;
          },
          validator: (value) {
            return profilePageController.validateFName(value!);
          },
        ),
      ),
    );
  }

  Widget lName() {
    return SizedBox(
      height: 64.h,
      child: Form(
        key: profilePageController.lNameFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          controller: profilePageController.lNameController,
          maxLength: 24,
          decoration: InputDecoration(
              hintText: "Enter Last Name",
              hintStyle: TextStyle(
                  color: AppColors.grayColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
              label: RichText(
                  text: TextSpan(
                      text: "Last Name",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                      children: const [
                    TextSpan(text: "*", style: TextStyle(color: Colors.red))
                  ])),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grayColor),
                  borderRadius: BorderRadius.circular(5.r))),
          onChanged: (value) {
            profilePageController.lName = value;
          },
          validator: (value) {
            return profilePageController.validateLName(value!);
          },
        ),
      ),
    );
  }

  Widget gender() {
    return SizedBox(
      height: 46.h,
      child: DropdownButtonFormField(
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          isExpanded: true,
          decoration: InputDecoration(
              hintText: "Choose Gender",
              hintStyle: TextStyle(
                  color: AppColors.grayColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
              label: RichText(
                  text: TextSpan(
                      text: "Gender",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                      children: const [
                    TextSpan(text: "*", style: TextStyle(color: Colors.red))
                  ])),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grayColor)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grayColor),
                  borderRadius: BorderRadius.circular(5.r))),
          items: _gender.map((e) {
            return DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                ));
          }).toList(),
          onChanged: (v) {}),
    );
  }

  Widget guardPosition() {
    return SizedBox(
      height: 46.h,
      child: DropdownButtonFormField(
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          isExpanded: true,
          decoration: InputDecoration(
              hintText: "Choose Guard Position",
              hintStyle: TextStyle(
                  color: AppColors.grayColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
              label: RichText(
                  text: TextSpan(
                      text: "Guard Position",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                      children: const [
                    TextSpan(text: "*", style: TextStyle(color: Colors.red))
                  ])),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grayColor)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grayColor),
                  borderRadius: BorderRadius.circular(5.r))),
          items: _guard.map((e) {
            return DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                ));
          }).toList(),
          onChanged: (v) {}),
    );
  }

  Widget mobileNumber() {
    return Form(
      key: profilePageController.mobileNumberFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: profilePageController.mobileNumberController,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
            hintText: "Enter Mobile Number",
            hintStyle: TextStyle(
                color: AppColors.grayColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
            label: RichText(
                text: TextSpan(
                    text: "Mobile Number",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                    children: const [
                  TextSpan(text: "*", style: TextStyle(color: Colors.red))
                ])),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grayColor),
                borderRadius: BorderRadius.circular(5.r))),
        onChanged: (value) {
          profilePageController.mobileNumber = value;
        },
        validator: (value) {
          return profilePageController.validateMobileNumber(value!);
        },
      ),
    );
  }

  Widget email() {
    return Form(
      key: profilePageController.emailFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: profilePageController.emailController,
        decoration: InputDecoration(

            // isDense: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
            hintText: "Enter Email",
            hintStyle: TextStyle(
                color: AppColors.grayColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
            label: RichText(
                text: TextSpan(
                    text: "Email ",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                    children: const [
                  TextSpan(text: "*", style: TextStyle(color: Colors.red))
                ])),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grayColor),
                borderRadius: BorderRadius.circular(5.r))),
        onChanged: (value) {
          profilePageController.email = value;
        },
        validator: (value) {
          return profilePageController.validEmail(value!);
        },
      ),
    );
  }
}

class DateOfBirth extends StatefulWidget {
  const DateOfBirth({super.key});

  @override
  State<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  DateTime selectedDate = DateTime.now();

  Future<DateTime?> _selectDate(context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
    return selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.h,
      child: TextFormField(
        keyboardType: TextInputType.none,
        controller: TextEditingController(
            text: selectedDate.toLocal().toString().split(" ")[0]),
        onChanged: (value) {
          value = selectedDate.toString();
        },
        onTap: () {
          _selectDate(context);
        },
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.calendar_today),
            hintText: "Choose Date of Birth",
            hintStyle: TextStyle(
                color: AppColors.grayColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(216, 216, 220, 1), width: 1.w)),
            label: RichText(
                text: TextSpan(
                    text: "Date of Birth",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                    children: const [
                  TextSpan(text: "*", style: TextStyle(color: Colors.red))
                ])),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grayColor),
                borderRadius: BorderRadius.circular(5.r))),
      ),
    );
  }
}

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
