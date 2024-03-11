import 'package:flutter/material.dart';
import 'package:form_login/progress_bar.dart';

class Assigngaurd extends StatefulWidget {
  const Assigngaurd({super.key});
  // const Assigngaurd({
  //   Key? key,
  // }) : super(key: key);

  @override
  State<Assigngaurd> createState() => _AssigngaurdState();
}

class _AssigngaurdState extends State<Assigngaurd> {
  final int pageIndex = 3;
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
          title: const Text("Assign Gaurd"),
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
                ),
              ),
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
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
                "Select Route to Assign Guard",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 327,
                  height: 46,
                  child: TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                        label: const Text("Select Route"),
                        hintText: "Select Route",
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
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const RoutePage()
                      //         ));
                    },
                    child: const Text("Save & Next")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
