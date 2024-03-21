import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:form_login/sgt_pages/country_state_city_model.dart';

class SgtMyAccount extends StatefulWidget {
  const SgtMyAccount({super.key});

  @override
  State<SgtMyAccount> createState() => _SgtMyAccountState();
}

class _SgtMyAccountState extends State<SgtMyAccount> {
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

  File? _myfile;
  ImagePicker picker = ImagePicker();

  Future<void> addImagefromGallary() async {
    final response = await picker.pickImage(source: ImageSource.gallery);
    if (response != null) {
      setState(() {
        _myfile = File(response.path);
      });
    } else {
      const CircularProgressIndicator();
    }
  }

  Future<void> addImagefromCamera() async {
    final response = await picker.pickImage(source: ImageSource.camera);
    if (response != null) {
      setState(() {
        _myfile = File(response.path);
      });
    } else {
      const CircularProgressIndicator();
    }
  }

  Future<void> showOption() async {
    return showModalBottomSheet(
        showDragHandle: true,
        context: context,
        builder: (context) {
          return SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                ListTile(
                  leading: IconButton(
                    onPressed: () {
                      addImagefromCamera();
                    },
                    icon: const Icon(Icons.camera_alt_outlined),
                  ),
                  title: const Text("Camera"),
                ),
                ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.photo),
                    onPressed: () {
                      addImagefromGallary();
                    },
                  ),
                  title: const Text("Gallary"),
                )
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              titleSpacing: -10,
              toolbarHeight: 63,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              title: const Text(
                "Edit Account",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(16, 13, 16, 0),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 32),
                  child: Form(
                    child: ListView(children: [
                      buildImage(),
                      const SizedBox(
                        height: 24,
                      ),
                      buildFirstName(),
                      buildLastName(),
                      buildCompanyName(),
                      buildBSISNumber(),
                      const SizedBox(
                        height: 20,
                      ),
                      buildFederalNumber(),
                      const SizedBox(
                        height: 20,
                      ),
                      buildStreetAddress(),
                      const SizedBox(
                        height: 20,
                      ),
                      buildPostalCode(),
                      const SizedBox(
                        height: 20,
                      ),
                      buildCountry(),
                      const SizedBox(
                        height: 20,
                      ),
                      buildState(),
                      const SizedBox(
                        height: 20,
                      ),
                      buildCity(),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
                  ),
                ),
              ),
            )));
  }

  Widget buildImage() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
              radius: 60,
              child: ClipOval(
                child: _myfile == null
                    ? Image.asset(
                        'assets/editAccountprofile.jpeg',
                        alignment: Alignment.topCenter,
                        width: 120,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        _myfile!,
                        width: 120,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
              )
              //  ClipRRect(
              //   borderRadius: BorderRadius.circular(60),
              //   child: const Image(
              //     alignment: Alignment.topCenter,
              //     width: 120,
              //     height: 120,
              //     image: AssetImage('assets/editAccountprofile.jpeg'),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              ),
          Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white54,
                child: IconButton(
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                  ),
                  onPressed: () {
                    showOption();
                  },
                ),
              ))
        ],
      ),
    );
  }

  Widget buildFirstName() {
    return TextFormField(
      maxLength: 24,
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
          label: const Text(
            "First Name",
            style: TextStyle(color: Colors.black87),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
  }

  Widget buildLastName() {
    return TextFormField(
      maxLength: 24,
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
          label: const Text(
            "Last Name",
            style: TextStyle(color: Colors.black87),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
  }

  Widget buildCompanyName() {
    return TextFormField(
      maxLength: 64,
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
          label: const Text(
            "Company Name",
            style: TextStyle(color: Colors.black87),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
  }

  Widget buildBSISNumber() {
    return TextFormField(
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
          label: const Text(
            "BSIS Number(Optional)",
            style: TextStyle(color: Colors.black87),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
  }

  Widget buildFederalNumber() {
    return TextFormField(
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
          label: const Text(
            "Federal Number(Optional)",
            style: TextStyle(color: Colors.black87),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
  }

  Widget buildStreetAddress() {
    return TextFormField(
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
          label: RichText(
              text: const TextSpan(
                  text: "Street address",
                  style: TextStyle(color: Colors.black87),
                  children: [
                TextSpan(text: "*", style: TextStyle(color: Colors.red))
              ])),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
  }

  Widget buildPostalCode() {
    return TextFormField(
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
          label: RichText(
              text: const TextSpan(
                  text: "Postal Code",
                  style: TextStyle(color: Colors.black87),
                  children: [
                TextSpan(text: "*", style: TextStyle(color: Colors.red))
              ])),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
  }

  List<Country>? snapshotData;
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

            return DropdownButtonFormField(
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
            );
          } else {
            return Container();
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

class countryStateCity {}
