import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/address_page/controller/address_controller.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/shared/controller/image_picker_controller.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/shared/view/image_picker.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/shared/view/new_guard_progress_bar.dart';
import 'package:form_login/sgt_pages/country_state_city_model.dart';
import 'package:form_login/styles/colors.dart';
import 'package:get/get.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  ImagePickerController imgController = Get.put(ImagePickerController());
  final addressController = Get.put(AddressController());

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

  Future<List<Country>> getCountries() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/country_state_city.json");
    List mapData = jsonDecode(data);

    List<Country> countryList =
        mapData.map((countries) => Country.fromJson(countries)).toList();
    // setState(() {
    //   print("========>${countryList}");
    // });
    print("========>${countryList}");

    return countryList;
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
                            currentIndex: 1,
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
                                      text: "Address",
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: AppColors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: " (Optional)",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: AppColors.disableColor,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.italic))
                                      ]),
                                ),

                                SizedBox(
                                  height: 12.h,
                                ),
                                buildStreetAddress(),
                                SizedBox(
                                  height: 7.h,
                                ),
                                buildPostalCode(),
                                SizedBox(
                                  height: 20.h,
                                ),

                                buildCountry(),
                                SizedBox(
                                  height: 20.h,
                                ),
                                buildState(),
                                SizedBox(
                                  height: 20.h,
                                ),
                                buildCity()
                                // buildEmail()
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
                                        borderRadius:
                                            BorderRadius.circular(6.r)),
                                    backgroundColor:
                                        !addressController.btnEnable.value
                                            ? AppColors.disableColor
                                            : AppColors.primaryColor,
                                    foregroundColor: AppColors.white),
                                onPressed: addressController.btnEnable.value
                                    ? () {
                                        print("======> click");
                                        // profileController.checkValid();
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
        ));
  }

  Widget buildStreetAddress() {
    return SizedBox(
      // height: 90.h,
      child: Form(
        // key: profileController.fNameFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          maxLines: 2,
          // controller: profileController.fNameController,
          maxLength: 64,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
              hintText: "Enter your Street Address...",
              hintStyle: TextStyle(
                  color: AppColors.grayColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
              label: Text(
                "Street Address",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grayColor),
                  borderRadius: BorderRadius.circular(5.r))),
          onChanged: (value) {
            // profileController.fName = value;
          },
          validator: (value) {
            // return profileController.validateFName(value!);
          },
          // focusNode: _fNameFocus,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          onFieldSubmitted: (value) {
            // FocusScope.of(context).requestFocus(_lNameFocus);
          },
        ),
      ),
    );
  }

  Widget buildPostalCode() {
    return SizedBox(
      // height: 90.h,
      child: Form(
        // key: profileController.fNameFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          // controller: profileController.fNameController,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
              hintText: "Enter Postal Code",
              hintStyle: TextStyle(
                  color: AppColors.grayColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
              label: Text(
                "Enter Postal Code",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grayColor),
                  borderRadius: BorderRadius.circular(5.r))),
          onChanged: (value) {
            // profileController.fName = value;
          },
          validator: (value) {
            // return profileController.validateFName(value!);
          },
          // focusNode: _fNameFocus,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          onFieldSubmitted: (value) {
            // FocusScope.of(context).requestFocus(_lNameFocus);
          },
        ),
      ),
    );
  }

  List<Country>? snapshotData;
  Widget buildCountry() {
    return FutureBuilder(
        future: getCountries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('print----------------1.ConnectionState.waiting');
            return const CircularProgressIndicator(
              strokeWidth: 1,
            );
          } else if (snapshot.hasError) {
            print('print----------------2');
            return Text("Error: ${snapshot.error}");
          } else if (!snapshot.hasData) {
            print('print----------------3');
            return const Text("No data available");
          } else {
            print('print----------------4.snapshot.hasData');
            snapshotData = snapshot.data;

            // print("snapshot.data:${snapshot.data}");
            return SizedBox(
              // height: double.maxFinite,
              child: DropdownButtonFormField(
                isExpanded: true,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                    label: RichText(
                      text: const TextSpan(
                          text: "Country",
                          style: TextStyle(color: Colors.black87),
                          children: [
                            TextSpan(
                                text: "*", style: TextStyle(color: Colors.red))
                          ]),
                    )),
                // onTap: () {
                //   print("${snapshotData!.map((e) => e.name)}");
                // },
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

                    print("selectedCountry:$selectedCountry");

                    selectedCountryStates = snapshotData!
                        .firstWhere((element) => element.name == newValue)
                        .states!;
                  });
                },
                value: selectedCountry,
              ),
            );
          }
        });
  }

  Widget buildState() {
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          label: RichText(
              text: const TextSpan(
                  text: "States",
                  style: TextStyle(color: Colors.black87),
                  children: [
                TextSpan(text: "*", style: TextStyle(color: Colors.red))
              ]))),
      items: selectedCountryStates
          .map((e) =>
              DropdownMenuItem<dynamic>(value: e.name!, child: Text(e.name!)))
          .toList(),
      onChanged: (newValue) {
        setState(() {
          selectedState = newValue;
          selectedCity = null;
          print("selected State: $selectedState");

          selectedStatesCities = selectedCountryStates
              .firstWhere((element) => element.name == newValue)
              .cities!;
          // if (selectedCountryStates == []) {
          //   print("states is empty");
          // } else {
          //   print("state data: $selectedState");
          // }
        });
      },
      value: selectedState,
    );
  }

  Widget buildCity() {
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          label: RichText(
            text: const TextSpan(
                text: 'Cities',
                style: TextStyle(color: Colors.black87),
                children: [
                  TextSpan(text: "*", style: TextStyle(color: Colors.red))
                ]),
          )),
      items: selectedStatesCities
          .map((e) => DropdownMenuItem(value: e.name!, child: Text(e.name!)))
          .toList(),
      onChanged: (newValue) {
        // selectedCity = "";
        setState(() {
          selectedCity = newValue;
          print("selectedCity: $selectedCity");
        });
      },
      value: selectedCity,
    );
  }
}
