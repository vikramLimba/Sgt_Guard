import 'package:flutter/material.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/shared/controller/location_picker_controller.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final locationController = Get.put(LocationPickerController());

  final GlobalKey<FormState> streetAddressFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> postalCodeFormKey = GlobalKey<FormState>();

  late TextEditingController streesAddressController, postalCodeController;

  var streetAddress = '', postalCode = '', country = '', state = '', city = '';

  RxBool isStreetAddressValid = false.obs, isPostalCodeValid = false.obs;

  RxBool btnEnable = false.obs;

  @override
  void onInit() {
    streesAddressController = TextEditingController();
    postalCodeController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    streesAddressController.dispose();
    postalCodeController.dispose();

    super.onClose();
  }

  String? validataStreetAdrees(String value) {
    if (value == "") {
      Future.delayed(Duration.zero, () {
        isStreetAddressValid.value = false;
        btnEnable.value = false;
      });

      return "\u24D8  Please Enter Street Address";
    }
    Future.delayed(Duration.zero, () {
      print("street Address valid");
      isStreetAddressValid.value = true;
      if (isStreetAddressValid.value && isPostalCodeValid.value
          //  &&
          // locationController.validBtnEnable.value
          ) {
        btnEnable.value = true;
      }
    });

    return null;
  }

  String? validatePostalCode(String value) {
    if (value == "") {
      Future.delayed(Duration.zero, () {
        isPostalCodeValid.value = false;
        btnEnable.value = false;
      });
      return "\u24D8  Please Enter Postal Code";
    }
    Future.delayed(Duration.zero, () {
      isPostalCodeValid.value = true;
      if (isStreetAddressValid.value && isPostalCodeValid.value
          // &&
          // locationController.validBtnEnable.value
          ) {
        btnEnable.value = true;
      }
    });
    return null;
  }

  void checkAddressValid() {
    locationController.checkLocationValid();
    isStreetAddressValid.value = streetAddressFormKey.currentState!.validate();
    if (!isStreetAddressValid.value) {
      btnEnable.value = false;
    } else {
      streetAddressFormKey.currentState!.save();
    }

    isPostalCodeValid.value = postalCodeFormKey.currentState!.validate();
    if (!isPostalCodeValid.value) {
      btnEnable.value = false;
    } else {
      postalCodeFormKey.currentState!.save();
    }
    if (isStreetAddressValid.value && isStreetAddressValid.value) {
      Get.toNamed("/PasswordPage")!.then((value) {
        streesAddressController.clear();
        postalCodeController.clear();
      });
    }
  }
}
