import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final GlobalKey<FormState> streetAddressFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> postalCodeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> countyFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> stateFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> cityFormKey = GlobalKey<FormState>();

  RxBool btnEnable = false.obs;
}
