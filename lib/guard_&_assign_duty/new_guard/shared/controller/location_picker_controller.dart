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
}
