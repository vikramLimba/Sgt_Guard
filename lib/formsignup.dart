import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

class FormSignup extends StatefulWidget {
  const FormSignup({
    super.key,
    this.getEmail,
  });
  final String? getEmail;

  @override
  State<FormSignup> createState() => _FormSignupState();
}

class _FormSignupState extends State<FormSignup> {
  File? _image;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  showOption() {
    showModalBottomSheet(
        backgroundColor: const Color.fromARGB(200, 255, 255, 255),
        context: context,
        builder: (context) => SizedBox(
              height: 150,
              child: Column(children: [
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text("camera"),
                  onTap: () {
                    Navigator.of(context).pop();
                    getImageFromCamera();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text("gallary"),
                  onTap: () {
                    Navigator.of(context).pop();
                    getImageFromGallery();
                  },
                )
              ]),
            ));
  }

  // Show options to get image from camera or gallery
  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  RegExp regexEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp regexContact = RegExp(r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/');

  final fName = TextEditingController();
  final lName = TextEditingController();
  final country = TextEditingController();
  final state = TextEditingController();
  final city = TextEditingController();
  final address = TextEditingController();
  final email = TextEditingController();
  final contact = TextEditingController();

  final assetsImage1 = 'assets/file.jpg';

  @override
  void initState() {
    email.text = widget.getEmail!;

    fName.addListener(() {
      setState(() {});
    });
    lName.addListener(() {
      setState(() {});
    });
    country.addListener(() {
      setState(() {});
    });
    state.addListener(() {
      setState(() {});
    });
    city.addListener(() {
      setState(() {});
    });
    address.addListener(() {
      setState(() {});
    });
    email.addListener(() {
      setState(() {});
    });
    contact.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    fName.dispose();
    lName.dispose();
    country.dispose();
    state.dispose();
    city.dispose();
    address.dispose();
    email.dispose();
    contact.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text("Sign up"),
          ),
          toolbarHeight: 34,
          shadowColor: Colors.black,
        ),
        body: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(24),
                child: ListView(
                  children: [
                    buildImage(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildFname(),
                    const SizedBox(
                      height: 10,
                    ),
                    buildLname(),
                    const SizedBox(
                      height: 10,
                    ),
                    buildContact(),
                    const SizedBox(
                      height: 10,
                    ),
                    buildEmail(),
                    const SizedBox(
                      height: 10,
                    ),
                    buildCountry(),
                    const SizedBox(
                      height: 10,
                    ),
                    buildState(),
                    const SizedBox(
                      height: 10,
                    ),
                    buildCity(),
                    const SizedBox(
                      height: 10,
                    ),
                    buildAddress(),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed:
                              (_formKey.currentState?.validate() == false)
                                  ? null
                                  : () {
                                      _formKey.currentState!.validate();
                                      fName.clear();
                                      lName.clear();
                                      contact.clear();
                                      email.clear();
                                      country.clear();
                                      state.clear();
                                      city.clear();
                                      address.clear();
                                    },
                          child: const Text("Submit")),
                      const SizedBox(
                        height: 14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("If you already have an account"),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "'Sign in' ",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

//build--image

  Widget buildImage() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            child: ClipOval(
              child: _image == null
                  ? const Icon(Icons.image_rounded)
                  : Image.file(
                      _image!,
                      height: 500,
                      width: 500,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: IconButton(
                onPressed: () {
                  showOption();
                },
                icon: const Icon(
                  Icons.camera_alt_sharp,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }

  Widget buildFname() {
    return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      controller: fName,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter a valid input";
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),

        label: Text("First Name"),
        // prefix: Icon(Icons.input),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildLname() {
    return TextFormField(
      controller: lName,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter a valid input";
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),

        label: Text("Last Name"),
        // prefix: Icon(Icons.input),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildCountry() {
    return TextFormField(
      controller: country,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter a valid input";
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        label: Text("Country"),
        // prefix: Icon(Icons.input),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildState() {
    return TextFormField(
      controller: state,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter a valid input";
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),

        label: Text("State"),
        // prefix: Icon(Icons.input),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildCity() {
    return TextFormField(
      controller: city,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter a valid input";
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),

        label: Text("City"),
        // prefix: Icon(Icons.input),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildAddress() {
    return TextFormField(
      controller: address,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter a valid input";
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),

        label: Text("Address"),
        // prefix: Icon(Icons.input),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      textInputAction: TextInputAction.done,
    );
  }

  Widget buildEmail() {
    return TextFormField(
      controller: email,
      validator: (value) {
        if (!regexEmail.hasMatch(value!) || value.isEmpty) {
          return "Enter a valid input";
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),

        label: Text("Email"),
        // prefix: Icon(Icons.input),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildContact() {
    return TextFormField(
      controller: contact,
      validator: (value) {
        if (value!.length < 10) {
          return "enter a valid number";
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),

        label: Text("contact"),
        // prefix: Icon(Icons.input),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
    );
  }
}
