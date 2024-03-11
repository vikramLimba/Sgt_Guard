// import 'dart:ffi' as size;

import 'package:flutter/material.dart';

class CreateRoute extends StatefulWidget {
  const CreateRoute({super.key});

  @override
  State<CreateRoute> createState() => _CreateRouteState();
}

class _CreateRouteState extends State<CreateRoute> {
  List<Widget> checkpoint = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            toolbarHeight: 36,
            centerTitle: false,
            titleSpacing: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            title: const Text(
              "Create Route",
              style: TextStyle(fontWeight: FontWeight.w700),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ListTile(
                        title: RichText(
                            text: const TextSpan(
                                text: "Add Checkpoint on the Route",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                                children: [
                              TextSpan(
                                  text: "*",
                                  style: TextStyle(color: Colors.red))
                            ])),
                        subtitle: const Text(
                          "Route clock-in & clock-out time will auto fill. ",
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.pin_drop_outlined,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      "Start",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 28),
                                  child: SizedBox(
                                    height: 46,
                                    width: 286,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          hintText:
                                              "Night shift (09:00 AM -12:00PM)",
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black87)),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4))),
                                          label: Text(
                                            "Shift Clock-In",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 12),
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                              width: 292,
                            ),

                            //=============> first checkpoint
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 26),
                                  child: SizedBox(
                                    width: 290,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 286,
                                                height: 41,
                                                child: DropdownButtonFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black87)),
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .vertical(
                                                                            top:
                                                                                Radius.circular(4))),
                                                            label: Text(
                                                              "Select Checkpoint",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 14),
                                                            )),
                                                    items: null,
                                                    onChanged: (e) {}),
                                              ),
                                              SizedBox(
                                                height: 46,
                                                width: 286,
                                                child: DropdownButtonFormField(
                                                    icon: const Icon(
                                                        Icons.access_time),
                                                    decoration:
                                                        const InputDecoration(
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                              color: Colors
                                                                  .black87,
                                                            )),
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius.vertical(
                                                                        bottom: Radius.circular(
                                                                            4))),
                                                            label: Text(
                                                                "Select Checkpoint time",
                                                                style: TextStyle(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            153,
                                                                            153,
                                                                            153,
                                                                            1),
                                                                    fontSize:
                                                                        14))),
                                                    items: null,
                                                    onChanged: (e) {}),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Padding(
                                        //   padding:
                                        //       const EdgeInsets.only(right: 10),
                                        //   child: SizedBox(
                                        //     width: 20,
                                        //     child: IconButton(
                                        //         onPressed: () {},
                                        //         icon: const Icon(
                                        //           Icons.delete_outline,
                                        //           color: Colors.red,
                                        //         )),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -15,
                                  left: -28,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                        height: 46,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 0),
                                        child: Text("CP1"),
                                      ),
                                      SizedBox(
                                        width: 20,
                                        height: checkpoint.isEmpty ? 120 : 90,
                                        child: const VerticalDivider(
                                          endIndent: 2,
                                          thickness: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),

                            //=============> checkpoint list

                            ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: List.generate(checkpoint.length,
                                  (index) => buildCheckpoint(index)),
                            ),
                            const SizedBox(
                              height: 16,
                              width: 292,
                            ),

                            //=============> add more button
                            Padding(
                              padding: checkpoint.isEmpty
                                  ? const EdgeInsets.only(left: 26)
                                  : const EdgeInsets.only(left: 0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      foregroundColor: Colors.white,
                                      fixedSize: checkpoint.isEmpty
                                          ? const Size(286, 46)
                                          : const Size(260, 46)),
                                  onPressed: () {
                                    setState(() {
                                      checkpoint.add(
                                          buildCheckpoint(checkpoint.length));
                                    });
                                  },
                                  child: const Text(
                                    "+ Add More Checkpoints",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  )),
                            ),
                            const SizedBox(
                              height: 16,
                              width: 292,
                            ),
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 2),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.pin_drop_outlined,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        "End",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 31),
                                  child: SizedBox(
                                    width: 286,
                                    height: 46,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          hintText:
                                              "Night Shift Clock-out - 12:00 AM",
                                          hintStyle: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black87)),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4))),
                                          label: Text(
                                            "Shift Clock-Out Point",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 12),
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        foregroundColor: Colors.white,
                        fixedSize: const Size(350, 46)),
                    onPressed: () {},
                    child: const Text(
                      "Save & Create Another Route",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    )),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue[900],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        fixedSize: const Size(350, 46)),
                    onPressed: () {},
                    child: const Text(
                      "Save & Next",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

//==========================>Build checkpoint
  Widget buildCheckpoint(int index) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
          width: 290,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SizedBox(
                width: 290,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 41,
                            child: DropdownButtonFormField(
                                decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black87)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(4))),
                                    label: Text("Select Checkpoint",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14))),
                                items: null,
                                onChanged: (e) {}),
                          ),
                          SizedBox(
                            height: 46,
                            child: DropdownButtonFormField(
                                icon: const Icon(Icons.access_time),
                                decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.black87,
                                    )),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(4))),
                                    label: Text("Select Checkpoint time",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14))),
                                items: null,
                                onChanged: (e) {}),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: 20,
                        child: InkWell(
                          child: const Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.red,
                          ),
                          onTap: () => setState(
                            () {
                              if (index >= 0 && index < checkpoint.length) {
                                checkpoint.removeAt(index);
                              }
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: -15,
              left: -28,
              child: Column(
                children: [
                  const SizedBox(
                    width: 20,
                    height: 46,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Text("CP${index + 1 + 1}"),
                  ),
                  const SizedBox(
                    width: 20,
                    height: 90,
                    child: VerticalDivider(
                      endIndent: 2,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
