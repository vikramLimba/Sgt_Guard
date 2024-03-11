import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:form_login/state_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:form_login/country_state_city_model.dart';

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
    // print("data:$data");
    List mapData = jsonDecode(data);
    // print("mapData:$mapData");

    List<Country> countryList =
        mapData.map((e) => Country.fromJson(e)).toList();
    // print("list: $countryList");

    return countryList;
  }

  // Future<List<List<Country>>> getCountries() async {
  //   String data = await DefaultAssetBundle.of(context)
  //       .loadString('assets/data/states.json');
  //   // print("data: $data");
  //   List mapData = jsonDecode(data);
  //   print('mapData:$mapData');

  //   List<Countries> countryList =
  //       mapData.map((e) => Countries.fromJson(e)).toList();
  //   // print('countryList:$countryList');

  //   List<List<Country>> countryNames =
  //       countryList.map((country) => country.countries).toList();
  //   // print("final countryNames:$countryNames");
  //   // for (List countryName in countryNames) {
  //   //   print('Country Name: $countryName');
  //   // }

  //   // for (Countries country in countryList) {
  //   //   print('Country Name: ${country.countries}');
  //   // }
  //   // return countryList;
  //   return countryNames;
  // }

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

  List<String> countryList = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "American Samoa",
    "Andorra",
    "Angola",
    "Anguilla",
    "Antarctica",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Aruba",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas (the)",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bermuda",
    "Bhutan",
    "Bolivia (Plurinational State of)",
    "Bonaire, Sint Eustatius and Saba",
    "Bosnia and Herzegovina",
    "Botswana",
    "Bouvet Island",
    "Brazil",
    "British Indian Ocean Territory (the)",
    "Brunei Darussalam",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cabo Verde",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Cayman Islands (the)",
    "Central African Republic (the)",
    "Chad",
    "Chile",
    "China",
    "Christmas Island",
    "Cocos (Keeling) Islands (the)",
    "Colombia",
    "Comoros (the)",
    "Congo (the Democratic Republic of the)",
    "Congo (the)",
    "Cook Islands (the)",
    "Costa Rica",
    "Croatia",
    "Cuba",
    "Curaçao",
    "Cyprus",
    "Czechia",
    "Côte d'Ivoire",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic (the)",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Eswatini",
    "Ethiopia",
    "Falkland Islands (the) [Malvinas]",
    "Faroe Islands (the)",
    "Fiji",
    "Finland",
    "France",
    "French Guiana",
    "French Polynesia",
    "French Southern Territories (the)",
    "Gabon",
    "Gambia (the)",
    "Georgia",
    "Germany",
    "Ghana",
    "Gibraltar",
    "Greece",
    "Greenland",
    "Grenada",
    "Guadeloupe",
    "Guam",
    "Guatemala",
    "Guernsey",
    "Guinea",
    "Guinea-Bissau",
    "Guyana",
    "Haiti",
    "Heard Island and McDonald Islands",
    "Holy See (the)",
    "Honduras",
    "Hong Kong",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran (Islamic Republic of)",
    "Iraq",
    "Ireland",
    "Isle of Man",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jersey",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "Korea (the Democratic People's Republic of)",
    "Korea (the Republic of)",
    "Kuwait",
    "Kyrgyzstan",
    "Lao People's Democratic Republic (the)",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Macao",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands (the)",
    "Martinique",
    "Mauritania",
    "Mauritius",
    "Mayotte",
    "Mexico",
    "Micronesia (Federated States of)",
    "Moldova (the Republic of)",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Montserrat",
    "Morocco",
    "Mozambique",
    "Myanmar",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands (the)",
    "New Caledonia",
    "New Zealand",
    "Nicaragua",
    "Niger (the)",
    "Nigeria",
    "Niue",
    "Norfolk Island",
    "Northern Mariana Islands (the)",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Palestine, State of",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines (the)",
    "Pitcairn",
    "Poland",
    "Portugal",
    "Puerto Rico",
    "Qatar",
    "Republic of North Macedonia",
    "Romania",
    "Russian Federation (the)",
    "Rwanda",
    "Réunion",
    "Saint Barthélemy",
    "Saint Helena, Ascension and Tristan da Cunha",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Martin (French part)",
    "Saint Pierre and Miquelon",
    "Saint Vincent and the Grenadines",
    "Samoa",
    "San Marino",
    "Sao Tome and Principe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Sint Maarten (Dutch part)",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "South Georgia and the South Sandwich Islands",
    "South Sudan",
    "Spain",
    "Sri Lanka",
    "Sudan (the)",
    "Suriname",
    "Svalbard and Jan Mayen",
    "Sweden",
    "Switzerland",
    "Syrian Arab Republic",
    "Taiwan",
    "Tajikistan",
    "Tanzania, United Republic of",
    "Thailand",
    "Timor-Leste",
    "Togo",
    "Tokelau",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Turks and Caicos Islands (the)",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirates (the)",
    "United Kingdom of Great Britain and Northern Ireland (the)",
    "United States Minor Outlying Islands (the)",
    "United States of America (the)",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Venezuela (Bolivarian Republic of)",
    "Viet Nam",
    "Virgin Islands (British)",
    "Virgin Islands (U.S.)",
    "Wallis and Futuna",
    "Western Sahara",
    "Yemen",
    "Zambia",
    "Zimbabwe",
    "Åland Islands"
  ];

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
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // buildCountryName(),
                      const SizedBox(
                        height: 20,
                      ),
                      buildCountryStateCityName(),
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

  Widget buildCountryStateCityName() {
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
            List<Country>? snapshotData = snapshot.data;
            // print("snapshot.data:$snapshot.data");
            return Column(
              children: [
                //======================Country
                DropdownButtonFormField(
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(216, 216, 220, 1),
                              width: 1)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      label: RichText(
                        text: const TextSpan(
                            text: "Country",
                            style: TextStyle(color: Colors.black87),
                            children: [
                              TextSpan(
                                  text: "*",
                                  style: TextStyle(color: Colors.red))
                            ]),
                      )),
                  items: snapshotData
                      ?.map((e) => DropdownMenuItem(
                          value: e.name.toString(),
                          child: Text(
                            e.name.toString(),
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
                const SizedBox(height: 20),

                //======================State
                DropdownButtonFormField(
                  isExpanded: true,
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(216, 216, 220, 1),
                              width: 1)),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      label: RichText(
                          text: const TextSpan(
                              text: "States",
                              style: TextStyle(color: Colors.black87),
                              children: [
                            TextSpan(
                                text: "*", style: TextStyle(color: Colors.red))
                          ]))),
                  items: selectedCountryStates
                      .map((e) => DropdownMenuItem<dynamic>(
                          value: e.name!, child: Text(e.name!)))
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
                ),
                const SizedBox(height: 20),

                //======================City
                DropdownButtonFormField(
                  isExpanded: true,
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(216, 216, 220, 1),
                              width: 1)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      label: RichText(
                        text: const TextSpan(
                            text: 'Cities',
                            style: TextStyle(color: Colors.black87),
                            children: [
                              TextSpan(
                                  text: "*",
                                  style: TextStyle(color: Colors.red))
                            ]),
                      )),
                  items: selectedStatesCities
                      .map((e) => DropdownMenuItem(
                          value: e.name!, child: Text(e.name!)))
                      .toList(),
                  onChanged: (newValue) {
                    // selectedCity = "";
                    setState(() {
                      selectedCity = newValue;
                      print("selectedCity: $selectedCity");
                    });
                  },
                  value: selectedCity,
                )
              ],
            );
          } else {
            return Container();
          }
        });
  }

  //  Widget buildCountryName() {
  //   return DropdownButtonFormField(
  //       menuMaxHeight: 200,
  //       decoration: InputDecoration(
  //           focusedBorder: const OutlineInputBorder(
  //               borderSide: BorderSide(
  //                   color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
  //           label: RichText(
  //               text: const TextSpan(
  //                   text: "Country",
  //                   style: TextStyle(color: Colors.black87),
  //                   children: [
  //                 TextSpan(text: "*", style: TextStyle(color: Colors.red))
  //               ])),
  //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
  //       isExpanded: true,
  //       items: countryList.map((items) {
  //         return DropdownMenuItem(value: items, child: Text(items));
  //       }).toList(),
  //       onChanged: (e) {
  //         setState(() {
  //           // selectedCountry = e;
  //           // print("selectedCountry: $selectedCountry");
  //         });
  //       });
  // }
  // {
  //   return FutureBuilder(
  //       future: getCountries(),
  //       builder: (context, snapshot) {
  //         // print("snapshot.data: $snapshot.data");
  //         selectedCountry ??= countryList.first;
  //         print("countryList.first: $selectedCountry");
  //         List<List<Country>>? countryNames = snapshot.data;
  //         // print("countryNames--:$countryNames");
  //         return Column(
  //           children: [
  //             DropdownButtonFormField(
  //                 isExpanded: true,
  //                 menuMaxHeight: 200,
  //                 items: countryNames
  //                     ?.expand((list) => list)
  //                     .map((e) => DropdownMenuItem(
  //                         value: e.country, child: Text(e.country)))
  //                     .toList(),
  //                 onChanged: (e) {
  //                   setState(() {
  //                     selectedCountry = e;
  //                     print("selectedCountry: $selectedCountry");
  //                     // selectedCountryStates = snapshot.data
  //                     // selectedCountryStates = snapshot.data.first;

  //                   });
  //                 }),
  //           ],
  //         );
  //       });
  // }
}
