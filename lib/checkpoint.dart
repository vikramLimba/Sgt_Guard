import 'package:flutter/material.dart';
import 'package:form_login/progress_bar.dart';
import 'package:form_login/route.dart';

class Checkpoint extends StatefulWidget {
  // const Checkpoint({
  //   Key? key,
  // }) : super(key: key);
  const Checkpoint({super.key});
  @override
  State<Checkpoint> createState() => _CheckpointState();
}

class _CheckpointState extends State<Checkpoint> {
  int pageIndex = 1;
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
          title: const Text("Create Checkpoint"),
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
                "Checkpoint Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 327,
                  height: 46,
                  child: TextField(
                    decoration: InputDecoration(
                        label: const Text("Checkpoint Name"),
                        hintText: "Enter Checkpoint",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 327,
                  height: 86,
                  child: TextFormField(
                    decoration: InputDecoration(
                        label: const Text("Checkpoint Description"),
                        hintText: "Write Description here",
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
                                builder: (context) => const RoutePage()));
                      });
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
