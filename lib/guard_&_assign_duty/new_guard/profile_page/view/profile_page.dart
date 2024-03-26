import 'dart:io';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:form_login/guard_&_assign_duty/new_guard/shared/view/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/profile_page/controller/profile_controller.dart';
import 'package:form_login/styles/colors.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/shared/controller/image_picker_controller.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/shared/view/new_guard_progress_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final profileController = Get.put(ProfileController());

  ImagePickerController imgController = Get.put(ImagePickerController());

  final List<String> _gender = ['Male', 'Female'];
  final List<String> _guard = ['Supervisor', 'Guard'];

  final _fNameFocus = FocusNode();
  final _lNameFocus = FocusNode();
  final _mobileNumberFocus = FocusNode();
  final _emailFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _fNameFocus.dispose();
    _lNameFocus.dispose();

    _mobileNumberFocus.dispose();
    _emailFocus.dispose();
  }

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
                              buildFName(),
                              SizedBox(
                                height: 7.h,
                              ),
                              buildLName(),
                              SizedBox(
                                height: 7.h,
                              ),
                              buildGender(),
                              SizedBox(
                                height: 20.h,
                              ),
                              buildGuardPosition(),
                              SizedBox(
                                height: 20.h,
                              ),
                              const DateOfBirth(),
                              SizedBox(
                                height: 20.h,
                              ),
                              buildMobileNumber(),
                              SizedBox(
                                height: 20.h,
                              ),
                              buildEmail()
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
                                  backgroundColor:
                                      !profileController.btnEnable.value
                                          ? AppColors.disableColor
                                          : AppColors.primaryColor,
                                  foregroundColor: AppColors.white),
                              onPressed: profileController.btnEnable.value
                                  ? () {
                                      print("======> click");
                                      profileController.checkValid();
                                    }
                                  : null
                              //  () {}
                              ,
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )),
                        )),
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

  Widget buildFName() {
    return SizedBox(
      height: 64.h,
      child: Form(
        key: profileController.fNameFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          controller: profileController.fNameController,
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
            profileController.fName = value;
          },
          validator: (value) {
            return profileController.validateFName(value!);
          },
          focusNode: _fNameFocus,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_lNameFocus);
          },
        ),
      ),
    );
  }

  Widget buildLName() {
    return SizedBox(
      height: 64.h,
      child: Form(
        key: profileController.lNameFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          controller: profileController.lNameController,
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
            profileController.lName = value;
          },
          validator: (value) {
            return profileController.validateLName(value!);
          },
          focusNode: _lNameFocus,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
        ),
      ),
    );
  }

  Widget buildGender() {
    return Form(
      key: profileController.genderFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: DropdownButtonFormField(
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        isExpanded: true,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
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
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ));
        }).toList(),
        onChanged: (value) {
          profileController.gender = value!;
        },
        validator: (value) {
          return profileController.validateGender(value ?? "");
        },
      ),
    );
  }

  Widget buildGuardPosition() {
    return Form(
      key: profileController.guardPositionFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: DropdownButtonFormField(
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        isExpanded: true,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
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
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ));
        }).toList(),
        onSaved: (newValue) {
          profileController.guardPosition = newValue!;
        },
        onChanged: (value) {
          profileController.guardPosition = value!;
        },
        validator: (value) {
          return profileController.validateGuardPosition(value ?? "");
        },
      ),
    );
  }

  Widget buildMobileNumber() {
    return Form(
      key: profileController.mobileNumberFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: profileController.mobileNumberController,
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
          profileController.mobileNumber = value;
        },
        validator: (value) {
          return profileController.validateMobileNumber(value!);
        },
        focusNode: _mobileNumberFocus,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(_emailFocus);
        },
      ),
    );
  }

  Widget buildEmail() {
    return Form(
      key: profileController.emailFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: profileController.emailController,
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
          profileController.email = value;
        },
        validator: (value) {
          return profileController.validEmail(value!);
        },
        focusNode: _emailFocus,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
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
  DateTime? selectedDate;
  var profileController1 = Get.find<ProfileController>();

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            backgroundColor: AppColors.white,
            content: SizedBox(
              height: 280.h,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: CalendarCarousel(
                  onDayPressed: (DateTime date, List events) {
                    setState(() {
                      selectedDate = date;
                    });
                    Navigator.of(context).pop();
                  },
                  selectedDayBorderColor: Colors.transparent,
                  selectedDayTextStyle: const TextStyle(
                      color: AppColors.white, fontWeight: FontWeight.w500),
                  selectedDayButtonColor: AppColors.black,
                  selectedDateTime: selectedDate,
                  weekdayTextStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black),
                  nextDaysTextStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.disableColor),
                  inactiveWeekendTextStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.disableColor),
                  inactiveDaysTextStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.disableColor),
                  daysTextStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black),
                  firstDayOfWeek: 1,
                  iconColor: AppColors.black,
                  weekendTextStyle: TextStyle(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  height: 380.h,
                  headerTextStyle: const TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  daysHaveCircularBorder: false,
                  todayTextStyle: selectedDate == null
                      ? const TextStyle(color: AppColors.white)
                      : TextStyle(
                          color: AppColors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                  todayButtonColor: selectedDate == null
                      ? AppColors.black
                      : Colors.transparent,
                  todayBorderColor: selectedDate == null
                      ? AppColors.black
                      : Colors.transparent,
                  minSelectedDate:
                      DateTime.now().subtract(const Duration(days: 1)),
                ),
              ),
            ),
          ));

  @override
  Widget build(BuildContext context) {
    String today = DateTime.now().toLocal().toString().split(" ")[0];
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: profileController1.dobFormKey,
      child: TextFormField(
        keyboardType: TextInputType.none,
        controller: TextEditingController(
            text: selectedDate == null
                ? today
                : selectedDate?.toLocal().toString().split(" ")[0]),
        onTap: () {
          openDialog();
        },
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
            suffixIcon: const Icon(Icons.calendar_today),
            hintText: "Choose Date of Birth",
            hintStyle: TextStyle(
                color: AppColors.grayColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: const Color.fromRGBO(216, 216, 220, 1), width: 1.w)),
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
        onChanged: (value) {
          profileController1.dateOfBirth = value;
          value = selectedDate.toString();
        },
        validator: (value) {
          return profileController1.validateDOB(value!);
        },
      ),
    );
  }
}
