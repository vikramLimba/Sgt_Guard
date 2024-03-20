import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final GlobalKey<FormState> fNameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> lNameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> genderFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> guardPositionFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> dobFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> mobileNumberFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  late TextEditingController fNameController,
      lNameController,
      genderController,
      guardPositionController,
      dobController,
      mobileNumberController,
      emailController;

  var fName = '';
  var lName = '';
  var gender = " ";
  var guardPosition = " ";
  var dateOfBirth = " ";

  var mobileNumber = '';
  var email = '';

  RxBool isFNameValid = false.obs;
  RxBool isLNameValid = false.obs;
  RxBool isGenderValid = false.obs;
  RxBool isGuradPositionValid = false.obs;
  RxBool isDobValid = false.obs;
  RxBool isMobileNumberValid = false.obs;
  RxBool isEmailValid = false.obs;

  RxBool btnEnable = false.obs;

  @override
  void onInit() {
    super.onInit();
    fNameController = TextEditingController();
    lNameController = TextEditingController();
    genderController = TextEditingController();
    guardPositionController = TextEditingController();
    dobController = TextEditingController();
    mobileNumberController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    fNameController.dispose();
    lNameController.dispose();
    genderController.dispose();
    guardPositionController.dispose();
    dobController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
  }

  String? validateFName(String value) {
    if (value == '' || value.isEmpty) {
      Future.delayed(Duration.zero, () {
        isFNameValid.value = false;
        btnEnable.value = false;
      });
      return "\u24D8  Please Enter First Name";
    }
    Future.delayed(Duration.zero, () {
      isFNameValid.value = true;
      if (isFNameValid.value &&
          isLNameValid.value &&
          isGenderValid.value &&
          isGuradPositionValid.value &&
          isMobileNumberValid.value &&
          isEmailValid.value) {
        btnEnable.value = true;
      }
    });
    return null;
  }

  String? validateLName(String value) {
    if (value == '' || value.isEmpty) {
      Future.delayed(Duration.zero, () {
        isLNameValid.value = false;
        btnEnable.value = false;
      });
      return "\u24D8  Please Enter Last Name";
    }

    Future.delayed(Duration.zero, () {
      isLNameValid.value = true;
      if (isFNameValid.value &&
          isLNameValid.value &&
          isGenderValid.value &&
          isGuradPositionValid.value &&
          isMobileNumberValid.value &&
          isEmailValid.value) {
        btnEnable.value = true;
      }
    });
    return null;
  }

  String? validateGender(String value) {
    if (value == ' ' || value.isEmpty) {
      Future.delayed(Duration.zero, () {
        isGenderValid.value = false;
        btnEnable.value = false;
      });
      return "\u24D8 Please select Gender";
    }
    Future.delayed(Duration.zero, () {
      isGenderValid.value = true;
      if (isFNameValid.value &&
          isLNameValid.value &&
          isGenderValid.value &&
          isGuradPositionValid.value &&
          isMobileNumberValid.value &&
          isEmailValid.value) {
        btnEnable.value = true;
      }
    });
    return null;
  }

  String? validateGuardPosition(String value) {
    if (value == '' || value.isEmpty) {
      Future.delayed(Duration.zero, () {
        isGuradPositionValid.value = false;
        btnEnable.value = false;
      });
      return '\u24D8 Please select Guard Position';
    }
    Future.delayed(Duration.zero, () {
      isGuradPositionValid.value = true;
      if (isFNameValid.value &&
          isLNameValid.value &&
          isGenderValid.value &&
          isGuradPositionValid.value &&
          isMobileNumberValid.value &&
          isEmailValid.value) {
        btnEnable.value = true;
      }
    });
    return null;
  }

  String? validateDOB(String value) {
    if (value == '' || value.isEmpty) {
      return 'u24D8 Please select Date Of Birth';
    }

    return null;
  }

  String? validateMobileNumber(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      Future.delayed(Duration.zero, (() {
        isMobileNumberValid.value = false;
        btnEnable.value = false;
      }));
      return "\u24D8  Enter valid Mobile Number";
    }
    Future.delayed(Duration.zero, (() {
      isMobileNumberValid.value = true;
      if (isFNameValid.value &&
          isLNameValid.value &&
          isGenderValid.value &&
          isGuradPositionValid.value &&
          isMobileNumberValid.value &&
          isEmailValid.value) {
        btnEnable.value = true;
      }
    }));

    return null;
  }

  String? validEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      Future.delayed(Duration.zero, () {
        isEmailValid.value = false;
        btnEnable.value = false;
      });
      return "\u24D8  Enter valid Email Id";
    }
    Future.delayed(Duration.zero, () {
      isEmailValid.value = true;
      if (isFNameValid.value &&
          isLNameValid.value &&
          isGenderValid.value &&
          isGuradPositionValid.value &&
          isMobileNumberValid.value &&
          isEmailValid.value) {
        btnEnable.value = true;
      }
    });

    return null;
  }

  void checkValid() {
    isFNameValid.value = fNameFormKey.currentState!.validate();
    if (!isFNameValid.value) {
      btnEnable.value = false;
    } else {
      fNameFormKey.currentState!.save();
    }

    isLNameValid.value = lNameFormKey.currentState!.validate();
    if (!isLNameValid.value) {
      btnEnable.value = false;
    } else {
      lNameFormKey.currentState!.save();
    }

    isGenderValid.value = genderFormKey.currentState!.validate();
    if (!isGenderValid.value) {
      btnEnable.value = false;
    } else {
      genderFormKey.currentState!.save();
    }

    isGuradPositionValid.value = guardPositionFormKey.currentState!.validate();
    if (!isGuradPositionValid.value) {
      btnEnable.value = false;
    } else {
      guardPositionFormKey.currentState!.save();
    }

    isDobValid.value = dobFormKey.currentState!.validate();
    if (!isDobValid.value) {
      btnEnable.value = false;
    } else {
      dobFormKey.currentState!.save();
    }

    isMobileNumberValid.value = mobileNumberFormKey.currentState!.validate();
    if (!isMobileNumberValid.value) {
      btnEnable.value = false;
    } else {
      mobileNumberFormKey.currentState!.save();
    }

    isEmailValid.value = emailFormKey.currentState!.validate();
    if (!isEmailValid.value) {
      btnEnable.value = false;
    } else {
      emailFormKey.currentState!.save();
    }
    if (isFNameValid.value &&
        isLNameValid.value &&
        isGenderValid.value &&
        isGuradPositionValid.value &&
        isDobValid.value &&
        isMobileNumberValid.value &&
        isEmailValid.value) {
      Get.toNamed("/AddressPage")!.then((value) {
        fNameController.clear();
        lNameController.clear();
        genderController.clear();
        guardPositionController.clear();
        dobController.clear();
        mobileNumberController.clear();
        emailController.clear();
      });
    }
  }
}
