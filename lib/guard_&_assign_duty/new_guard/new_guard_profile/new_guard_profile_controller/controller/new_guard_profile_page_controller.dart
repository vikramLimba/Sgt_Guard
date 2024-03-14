import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewGuardProfilePageController extends GetxController {
  final GlobalKey<FormState> fNameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> lNameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> mobileNumberFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  late TextEditingController fNameController,
      lNameController,
      mobileNumberController,
      emailController;

  var fName = '';
  var lName = '';
  var mobileNumber = '';
  var email = '';

  RxBool isFNameValid = false.obs;
  RxBool isLNameValid = false.obs;
  RxBool isMobileNumberValid = false.obs;
  RxBool isEmailValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    fNameController = TextEditingController();
    lNameController = TextEditingController();
    mobileNumberController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    fNameController.dispose();
    lNameController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
  }

  String? validateFName(String value) {
    if (value == '' || value.isEmpty) {
      return "\u24D8  Please Enter First Name";
    }
    return null;
  }

  String? validateLName(String value) {
    if (value == '' || value.isEmpty) {
      return "\u24D8  Please Enter Last Name";
    }
    return null;
  }

  String? validateMobileNumber(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return "\u24D8  Enter valid Mobile Number";
    }
    return null;
  }

  String? validEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      Future.delayed(Duration.zero, () {
        isEmailValid.value = false;
      });
      return "\u24D8  Enter valid Email Id";
    }
    Future.delayed(Duration.zero, () {
      isEmailValid.value = true;
    });

    return null;
  }
}
