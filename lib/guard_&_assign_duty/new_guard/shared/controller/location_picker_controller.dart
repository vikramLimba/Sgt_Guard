import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_login/sgt_pages/country_state_city_model.dart';
import 'package:get/get.dart';

class LocationPickerController extends GetxController {
  final GlobalKey<FormState> countryFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> stateFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> cityFormKey = GlobalKey<FormState>();

  late TextEditingController countryController, stateController, cityController;

  var selectedCountry = "".obs;
  var selectedState = "".obs;
  var selectedCity = "".obs;

  List selectedCountryStates = [].obs;
  List selectedStatesCities = [].obs;

  RxBool isCountryValid = false.obs,
      isStateValid = false.obs,
      isCityValid = false.obs;

  RxBool validBtnEnable = false.obs;

  @override
  void onInit() {
    countryController = TextEditingController();
    stateController = TextEditingController();
    cityController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    countryController.dispose();
    stateController.dispose();
    cityController.dispose();

    super.dispose();
  }

  String? validateCountry(String value) {
    if (value.isEmpty || value == '') {
      Future.delayed(Duration.zero, () {
        isCountryValid.value = false;
        return "\u24D8  Please Select Country";
      });
    }
    Future.delayed(Duration.zero, () {
      print("country valid");
      isCountryValid.value = true;
      if (isCountryValid.value && isStateValid.value && isCityValid.value) {
        validBtnEnable.value = true;
      }
    });

    return null;
  }

  String? validateState(String value) {
    if (value == "") {
      Future.delayed(Duration.zero, () {
        isStateValid.value = false;
        return "\u24D8  Please Select State";
      });
    }
    Future.delayed(Duration.zero, () {
      isStateValid.value = true;
      if (isCountryValid.value && isStateValid.value && isCityValid.value) {
        validBtnEnable.value = true;
      }
    });
    return null;
  }

  String? validateCity(String value) {
    if (value == "") {
      Future.delayed(Duration.zero, () {
        isCityValid.value = false;
        return "\u24D8  Please Select City";
      });
    }
    Future.delayed(Duration.zero, () {
      isCityValid.value = true;
      if (isCountryValid.value && isStateValid.value && isCityValid.value) {
        validBtnEnable.value = true;
      }
    });
    return null;
  }

  void checkLocationValid() {
    isCountryValid.value = countryFormKey.currentState!.validate();
    if (!isCountryValid.value) {
      validBtnEnable.value = false;
    } else {
      countryFormKey.currentState!.save();
    }

    isStateValid.value = stateFormKey.currentState!.validate();
    if (!isStateValid.value) {
      validBtnEnable.value = false;
    } else {
      stateFormKey.currentState!.save();
    }

    if (!isCityValid.value) {
      validBtnEnable.value = false;
    } else {
      cityFormKey.currentState!.save();
    }
  }
}
