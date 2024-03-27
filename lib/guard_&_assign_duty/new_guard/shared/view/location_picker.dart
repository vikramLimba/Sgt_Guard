// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/shared/controller/location_picker_controller.dart';
import 'package:form_login/sgt_pages/country_state_city_model.dart';
import 'package:form_login/styles/colors.dart';
import 'package:get/get.dart';

class LocationPicker extends StatefulWidget {
  final LocationPickerController locationController;

  const LocationPicker({super.key, required this.locationController});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  LocationPickerController locationController =
      Get.put(LocationPickerController());

  String? selectedCountry;
  String? selectedState;
  String? selectedCity;

  List<States> selectedCountryStates = [];
  List<Cities> selectedStatesCities = [];

  @override
  void initState() {
    getCountries();

    super.initState();
  }

  Future getCountries() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/country_state_city.json");
    List mapData = jsonDecode(data);

    List<Country> countryList =
        mapData.map((e) => Country.fromJson(e)).toList();

    return countryList;
  }

  List<Country>? snapshotData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCountry(),
        SizedBox(
          height: 20.h,
        ),
        buildState(),
        SizedBox(height: 20.h),
        buildCity(),
      ],
    );
  }

  Widget buildCountry() {
    return FutureBuilder(
        future: getCountries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('print----------------1');
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            print('print----------------2');
            return Text("Error: ${snapshot.error}");
          } else if (!snapshot.hasData) {
            print('print----------------3');
            return const Text("No data available");
          } else if (snapshot.hasData) {
            print('print----------------4');

            snapshotData = snapshot.data;

            return Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: locationController.countryFormKey,
              child: DropdownButtonFormField(
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r)),
                    label: Text(
                      "Country",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w300),
                    )
                    // RichText(
                    //   text: const TextSpan(
                    //       text: "Country",
                    //       style: TextStyle(color: Colors.black87),
                    //       children: [
                    //         TextSpan(
                    //             text: "*", style: TextStyle(color: Colors.red))
                    //       ]),
                    // )
                    ),
                items: snapshotData
                    ?.map((country) => DropdownMenuItem(
                        value: country.name.toString(),
                        child: Text(
                          country.name.toString(),
                        )))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedCountry = newValue;
                    selectedState = null;
                    selectedCity = null;
                    selectedStatesCities = [];
                    selectedCountryStates = [];
                    print("selectedCountry:$selectedCountry");

                    selectedCountryStates = snapshotData!
                        .firstWhere((element) => element.name == newValue)
                        .states!;
                  });
                },
                value: selectedCountry,
                // validator: (value) {
                //   return locationController.validateCountry(value!);
                // },
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Widget buildState() {
    return Form(
      key: locationController.stateFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: DropdownButtonFormField(
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        isExpanded: true,
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.r))),
            label: Text(
              "State",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 12.h,
                  fontWeight: FontWeight.w300),
            )
            //  RichText(
            //     text: const TextSpan(
            //         text: "States",
            //         style: TextStyle(color: Colors.black87),
            //         children: [
            //       TextSpan(text: "*", style: TextStyle(color: Colors.red))
            //     ]))
            ),
        items: selectedCountryStates
            .map((state) => DropdownMenuItem<dynamic>(
                value: state.name.toString(),
                child: Text(state.name.toString())))
            .toList(),
        onChanged: (newValue) {
          setState(() {
            selectedState = newValue;
            selectedCity = null;
            print("selected State: $selectedState");

            selectedStatesCities = selectedCountryStates
                .firstWhere((element) => element.name == newValue)
                .cities!;
          });
        },
        value: selectedState,
        // validator: (value) {
        //   return locationController.validateState(value!);
        // },
      ),
    );
  }

  Widget buildCity() {
    return Form(
      child: DropdownButtonFormField(
        key: locationController.cityFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        isExpanded: true,
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            label: Text(
              "City",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 12.h,
                  fontWeight: FontWeight.w300),
            )
            //  RichText(
            //   text: const TextSpan(
            //       text: 'Cities',
            //       style: TextStyle(color: Colors.black87),
            //       children: [
            //         TextSpan(text: "*", style: TextStyle(color: Colors.red))
            //       ]),
            // )
            ),
        items: selectedStatesCities
            .map((e) => DropdownMenuItem(value: e.name!, child: Text(e.name!)))
            .toList(),
        onChanged: (newValue) {
          setState(() {
            selectedCity = newValue;
            print("selectedCity: $selectedCity");
          });
        },
        value: selectedCity,
        // validator: (value) {
        //   return locationController.validateCity(value!);
        // },
      ),
    );
  }
}
