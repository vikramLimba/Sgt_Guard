import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/password_page/controller/password_controller.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/password_page/controller/visibility_controller.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/shared/controller/image_picker_controller.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/shared/view/image_picker.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/shared/view/new_guard_progress_bar.dart';
import 'package:form_login/styles/colors.dart';
import 'package:get/get.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final passwordController = Get.put(PasswordController());
  final visibilityController = Get.put(VisibilityController());

  final imgController = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: AppColors.backgroundColor,
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
                        currentIndex: 3,
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
                            RichText(
                              text: TextSpan(
                                  text: "Create Password",
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
                            buildPassword(),
                            SizedBox(
                              height: 20.h,
                            ),
                            buildConfirmPassword(),
                            SizedBox(
                              height: 8.h,
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "Minimum 8 character, must be one uppercase letter, number & symbol.",
                    style: TextStyle(
                      color: AppColors.grayColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
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
                                    !passwordController.btnEnabled.value
                                        ? AppColors.disableColor
                                        : AppColors.primaryColor,
                                foregroundColor: AppColors.white),
                            onPressed: passwordController.btnEnabled.value
                                ? () {
                                    passwordController.checkPassword();
                                  }
                                : null
                            //  () {}
                            ,
                            child: Text(
                              "Save & Invite",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            )),
                      )),
                ],
              ),
            ),
          )),
    );
  }

  Widget buildPassword() {
    return SizedBox(
      // height: 90.h,
      child: Obx(
        () => Form(
          key: passwordController.passwordFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: TextFormField(
            controller: passwordController.passwordController,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
                hintText: "Create Password",
                hintStyle: TextStyle(
                    color: AppColors.grayColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
                label: Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87),
                ),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.grayColor),
                    borderRadius: BorderRadius.circular(5.r)),
                suffixIcon: IconButton(
                    iconSize: 22.w,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      visibilityController.ishidden1.value =
                          !visibilityController.ishidden1.value;
                    },
                    icon: Icon(visibilityController.ishidden1.value
                        ? Icons.visibility_off
                        : Icons.visibility))),
            obscureText: visibilityController.ishidden1.value,
            onChanged: (value) {
              setState(() {
                passwordController.password = value;
              });
            },
            validator: (value) {
              return passwordController.validatePassword(value!);
            },
            // focusNode: _fNameFocus,
            // onTapOutside: (event) {
            //   // FocusScope.of(context).unfocus();
            // },
            // onFieldSubmitted: (value) {
            //   // FocusScope.of(context).requestFocus(_lNameFocus);
            // },
          ),
        ),
      ),
    );
  }

  Widget buildConfirmPassword() {
    return SizedBox(
      // height: 90.h,
      child: Obx(
        () => Form(
          key: passwordController.confirmPasswordFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: TextFormField(
            controller: passwordController.confirmPasswordController,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
                hintText: "Confirm Password",
                hintStyle: TextStyle(
                    color: AppColors.grayColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
                label: Text(
                  "Confirm Password",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87),
                ),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.grayColor),
                    borderRadius: BorderRadius.circular(5.r)),
                suffixIcon: IconButton(
                    iconSize: 22.w,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      visibilityController.ishidden2.value =
                          !visibilityController.ishidden2.value;
                    },
                    icon: Icon(visibilityController.ishidden2.value
                        ? Icons.visibility_off
                        : Icons.visibility))),
            obscureText: visibilityController.ishidden2.value,
            onChanged: (value) {
              setState(() {
                passwordController.confirmPassword = value;
              });
            },
            validator: (value) {
              return passwordController.validateConfirmPassword(value!);
            },
            // focusNode: _fNameFocus,
            // onTapOutside: (event) {
            //   // FocusScope.of(context).unfocus();
            // },
            // onFieldSubmitted: (value) {
            //   // FocusScope.of(context).requestFocus(_lNameFocus);
            // },
          ),
        ),
      ),
    );
  }
}
