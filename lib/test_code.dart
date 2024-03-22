import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/shared/view/countryStateCityPicker.dart';
import 'package:form_login/sgt_pages/country_state_city_model.dart';

class StackOver extends StatefulWidget {
  const StackOver({super.key});

  @override
  _StackOverState createState() => _StackOverState();
}

class _StackOverState extends State<StackOver>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;

  List<States> selectedCountryStates = [];
  List<Cities> selectedStatesCities = [];

  Future<List<Country>> getCountries() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/country_state_city.json");
    List mapData = jsonDecode(data);

    List<Country> countryList =
        mapData.map((countries) => Country.fromJson(countries)).toList();
    // setState(() {
    //   print("========>${countryList}");
    // });
    // print("========>${countryList}");

    return countryList;
  }

  @override
  void initState() {
    getCountries();

    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tab bar',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Colors.green,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Tab(
                      text: 'Place Bid',
                    ),
                  ),

                  // second tab [you can add an icon using the icon property]
                  const Tab(
                    text: 'Buy Now',
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(child: const CountryStateCityPicker()),
                  ),
                  // first tab bar view widget
                  // Center(
                  //   child: Text(
                  //     'Place Bid',
                  //     style: TextStyle(
                  //       fontSize: 25,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),

                  // second tab bar view widget
                  const Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Country>? snapshotData;
  Widget buildCountry() {
    return FutureBuilder<List<Country>>(
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

            return DropdownButtonFormField(
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
              items: snapshotData!
                  .map((country) => DropdownMenuItem<dynamic>(
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
          }
        });
  }
}
