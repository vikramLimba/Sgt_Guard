import 'package:flutter/material.dart';
import 'package:form_login/sgt_pages/checkpoint.dart';
import 'package:form_login/sgt_pages/progress_bar.dart';

class Shift extends StatefulWidget {
  const Shift({super.key});
  // const Shift({Key? key}) : super(key: key);

  @override
  State<Shift> createState() => _ShiftState();
}

class _ShiftState extends State<Shift> {
  late int pageIndex = 0; // Index of the current page

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            title: const Text("Create Shift"),
            centerTitle: false,
            titleSpacing: 0,
            toolbarHeight: 63,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42),
                    child: Row(
                      children: [ProgressBar(currentIndex: pageIndex)],
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Image(
                    width: 343,
                    height: 178,
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/radisson.jpeg",
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 343,
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Property Name: ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Text(
                                "Radission Blu Hotel ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.indigo[900]),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Address ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Text(
                                "New south hampton USA. ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.indigo[900]),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Property description: ",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "This is a Property description area where in person can write basic description of the property.  ",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )
                        ],
                      ),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Shift for radission blu hotel",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 327,
                    height: 46,
                    child: TextField(
                      decoration: InputDecoration(
                          label: const Text("Shift Name"),
                          hintText: "Enter Shift Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 327,
                    height: 46,
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.access_time_sharp),
                          label: const Text("Clock-In Time*"),
                          hintText: "Enter Clock-In Time",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(343, 46),
                          backgroundColor: Colors.indigo[900],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      onPressed: () {
                        setState(() {
                          pageIndex++;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Checkpoint()));
                        });
                      },
                      child: const Text("Save & Next")),
                ),
              ],
            ),
          ),
        ));
  }
}
