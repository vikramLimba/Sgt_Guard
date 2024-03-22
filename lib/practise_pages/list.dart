import 'dart:convert';
import 'dart:math';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _ListState();
}

class _ListState extends State<MyList> {
  final Set<Map<String, String>> companyData = {
    {'name': "Shubham Sharma", "job": "CEO", "posting": "SGNR"},
    {'name': "Piyush Sharma", "job": "Sr. Developer", "posting": "SGNR"},
    {'name': "Kuldeep Yadav", "job": "Sr. Developer", "posting": "SGNR"},
    {'name': "Mukesh kumar", "job": "Sr. Developer", "posting": "SGNR"},
    {'name': "Chhavikant", "job": "Backend Developer", "posting": "SGNR"},
    {'name': "Daya Limba", "job": "Backend Developer", "posting": "SGNR"},
  };

  final user = {"name": "Bharat"};

  late final data = jsonEncode(user);

  late final jsonData = jsonDecode(data);

  late final str = data.toString();

  List<String> gender = ["Male", "Female"];
  List<String> assignRole = ["Guard", "Manager", "Supervisor"];

  String? _dropdownValue;
  String init = "male";

  @override
  Widget build(BuildContext context) {
    // final person = List.generate(50, (i) => "Item$i");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(toolbarHeight: 20),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              // Expanded(
              //   child: ListView(
              //       children: companyData.map((companyInfo) {
              //     return Padding(
              //       padding: const EdgeInsets.all(12.0),
              //       child: Card(
              //         color: Colors.green[50],
              //         child: ListTile(
              //           title: Text(companyInfo["name"]!),
              //           subtitle: Text(companyInfo["job"]!),
              //           trailing: Text(companyInfo["posting"]!),
              //         ),
              //       ),
              //     );
              //   }).toList()),
              // child: ListView.builder(
              //     itemCount: person.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return ListTile(
              //         leading: const Icon(Icons.hive_rounded),
              //         title: Text("Item $index"),
              //         trailing:
              //             const Icon(Icons.fiber_smart_record_outlined),
              //       );
              //     }),
              // ),
              // Expanded(
              //     child: ListTile(
              //   title: Text(jsonData["name"]),
              // )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                      labelText: "Gender",
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.black))),
                  items: gender.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _dropdownValue = newValue!;
                    });
                  },
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                    // value: init,
                    decoration: InputDecoration(
                        labelText: "Assign Role",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    items: assignRole.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _dropdownValue = newValue!;
                      });
                    }),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(_dropdownValue.toString()),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Go back",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: Transform.rotate(
                  angle: 90 * (pi / 180),
                  child: const Divider(
                    height: 50,
                    thickness: 5,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
