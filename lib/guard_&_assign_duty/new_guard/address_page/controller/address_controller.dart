import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final GlobalKey<FormState> streetAddressFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> postalCodeFormKey = GlobalKey<FormState>();

  late TextEditingController streesAddressController, postalCodeController;

  var streetAddress = '', postalCode = '', country = '', state = '', city = '';

  RxBool isStreetAddressValid = false.obs,
      isPostalCodeValid = false.obs,
      isCountryValid = false.obs,
      isStateValid = false.obs,
      isCityValid = false.obs;

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
    return null;
  }

  String? validateCountry(String value) {
    if (value == "") {
      isCountryValid.value = false;
      return "\u24D8  Please Select Country";
    }
    return null;
  }

  String? validateState(String value) {
    if (value == "") {
      isStateValid.value = false;
      return "\u24D8  Please Select State";
    }
    return null;
  }

  String? validateCity(String value) {
    if (value == "") {
      isCityValid.value = false;
      return "\u24D8  Please Select City";
    }
    return null;
  }
}
