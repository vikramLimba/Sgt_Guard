// import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_login/practise_pages/formsignup.dart';

import 'package:get/route_manager.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // TextEditingController _emailController TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var email = "";
  var password = "";
  bool isPasswordvisible = false;

  RegExp regexEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp regexPass =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  final _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;
  // bool _click = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sign in"),
          shadowColor: const Color.fromRGBO(0, 0, 0, 1),
          toolbarHeight: 35,
        ),
        body: Form(
          autovalidateMode: _autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ListView(
                    children: [
                      buildEmail(),
                      const SizedBox(
                        height: 14,
                      ),
                      buildPassword(),
                    ],
                  ),
                ),
              ),

              //buttons
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        // onFocusChange: (value) {
                        //   AutovalidateMode.disabled;
                        // },
                        onPressed: (_formKey.currentState?.validate() == false)
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  emailController.clear();
                                  passwordController.clear();
                                  setState(() {
                                    _autoValidate = false;
                                    print("false");
                                  });
                                } else {
                                  setState(() {
                                    _formKey.currentState?.validate() == true;
                                    _autoValidate = true;
                                    print("true");
                                  });
                                }
                              },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.black),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("If you don't have an account"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FormSignup(
                                            getEmail: emailController.text,
                                          )));

                              Future.delayed(const Duration(seconds: 1), () {
                                emailController.clear();
                              });
                            },
                            child: const Text(
                              " 'Sign up' ",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16),
                            )),
                        TextButton(
                            onPressed: () {
                              Get.toNamed('mylist');
                            },
                            child: const Text(
                              "list",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 28),
                            )),
                        TextButton(
                            onPressed: () {
                              Get.toNamed('SgtMyAccount');
                            },
                            child: const Text(
                              "SGT My Account",
                              style: TextStyle(
                                  fontSize: 28, color: Colors.blueAccent),
                            )),
                        TextButton(
                            onPressed: () {
                              Get.toNamed("CreateRoute");
                            },
                            child: const Text(
                              "Route Page",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 28),
                            )),
                        TextButton(
                            onPressed: () {
                              Get.toNamed('Shift');
                            },
                            child: const Text(
                              "Shift",
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600),
                            )),
                        TextButton(
                            onPressed: () {
                              buildBottomSheet();
                            },
                            child: const Text(
                              "Bottom Sheet",
                              style: TextStyle(
                                  color: Colors.pinkAccent,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600),
                            )),
                        TextButton(
                            onPressed: () {
                              Get.toNamed('Properties');
                            },
                            child: const Text(
                              "Properties",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600),
                            )),
                        TextButton(
                            onPressed: () {
                              Get.toNamed('SelectPlan');
                            },
                            child: const Text(
                              "Select Plan",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600),
                            )),
                        TextButton(
                            onPressed: () {
                              Get.toNamed('PasswordPage');
                            },
                            child: Text(
                              "Add New Guard",
                              style: TextStyle(
                                  color: Colors.amber[900],
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600),
                            )),
                        TextButton(
                            onPressed: () {
                              Get.toNamed('StackOver');
                            },
                            child: const Text(
                              "Test Code",
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmail() {
    return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      validator: (value) {
        if (!regexEmail.hasMatch(value!)) {
          return "wrong inputs";
        } else {
          return null;
        }
      },
      controller: emailController,
      decoration: InputDecoration(
        hintText: "example@gmail.com",
        prefixIcon: const Icon(Icons.mail),
        suffixIcon: emailController.text.isEmpty
            ? Container(
                width: 10,
              )
            : IconButton(
                onPressed: () {
                  emailController.clear();
                },
                icon: const Icon(Icons.close)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        label: const Text("Email"),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildPassword() {
    return TextFormField(
      controller: passwordController,
      validator: (value) {
        if (!regexPass.hasMatch(value!)) {
          return "wrong inputs";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.key),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isPasswordvisible = !isPasswordvisible;
            });
          },
          icon: isPasswordvisible
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
        labelText: "Password",
        // errorText: "wrong password",
        hintText: "*****",
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      obscureText: !isPasswordvisible,
    );
  }

  List<Map<dynamic, dynamic>> checkInData = [
    {'name': 'Radission BLue Hotel 1', 'status': 'Visited', 'time': ''},
    {'name': 'Radission BLue Hotel 1', 'status': 'Missed', 'time': ''},
    {'name': 'Radission BLue Hotel 1', 'status': 'Visited', 'time': ''},
    {
      'name': 'Radission BLue Hotel 1',
      'status': 'Check-in',
      'time': '10:00 AM'
    },
    {
      'name': 'Radission BLue Hotel 1',
      'status': 'Check-in',
      'time': '10:00 AM'
    },
    {'name': 'Radission BLue Hotel 1', 'status': 'Check-in', 'time': '10:00 AM'}
  ];

  Future buildBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(211, 219, 232, 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                    child: ListTile(
                      contentPadding: const EdgeInsets.fromLTRB(16, 4, 32, 4),
                      leading: Padding(
                        padding: const EdgeInsets.only(right: 21),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.indigo[900],
                              borderRadius: BorderRadius.circular(50)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock_clock_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "Start",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                      title: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Image(
                                height: 30,
                                width: 30,
                                image: AssetImage("assets/barcode.png")),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Radission Blu Hotel 1",
                                style: TextStyle(color: Colors.indigo[900]),
                              ),
                              RichText(
                                  text: const TextSpan(
                                      text: "Clock-in:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                      children: [
                                    TextSpan(
                                        text: "10:00 AM",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]))
                            ],
                          )
                        ],
                      ),
                      trailing: Icon(
                        Icons.location_searching_outlined,
                        color: Colors.indigo[900],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: checkInData.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SizedBox(
                              height: 64,
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(16, 4, 32, 4),
                                leading: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("CP${index + 1}"),
                                    Padding(
                                        padding: checkInData[index] ==
                                                checkInData.elementAt(3)
                                            ? const EdgeInsets.only(
                                                left: 9, right: 30)
                                            : const EdgeInsets.only(
                                                left: 12, right: 30),
                                        child: checkInData[index]['status'] ==
                                                'Visited'
                                            ? Container(
                                                height: 8,
                                                width: 8,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                              )
                                            : checkInData[index]['status'] ==
                                                    'Missed'
                                                ? Container(
                                                    height: 8,
                                                    width: 8,
                                                    decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                  )
                                                : checkInData[index] ==
                                                        checkInData.elementAt(3)
                                                    ? Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        color:
                                                            Colors.indigo[900],
                                                        size: 14,
                                                        shadows: const [
                                                          Shadow(
                                                            color: Colors.blue,
                                                            blurRadius: 7,
                                                          )
                                                        ],
                                                      )
                                                    :
                                                    // : checkInData[index]
                                                    //             ['status'] ==
                                                    //         'Check-in'
                                                    //     ?
                                                    Container(
                                                        height: 8,
                                                        width: 8,
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50)),
                                                      ))
                                  ],
                                ),
                                title: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Image(
                                          height: 30,
                                          width: 30,
                                          image:
                                              AssetImage("assets/barcode.png")),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Radission Blu Hotel 1",
                                          style: TextStyle(
                                              color: Colors.indigo[900]),
                                        ),
                                        RichText(
                                            text: TextSpan(
                                                text:
                                                    "${checkInData[index]['status']} ",
                                                style: TextStyle(
                                                    color: checkInData[index]
                                                                ['status'] ==
                                                            'Visited'
                                                        ? Colors.green
                                                        : checkInData[index][
                                                                    'status'] ==
                                                                'Missed'
                                                            ? Colors.red
                                                            : Colors.grey,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                children: [
                                              TextSpan(
                                                  text: checkInData[index]
                                                              ['status'] ==
                                                          'Check-in'
                                                      ? ':'
                                                      : ''),
                                              TextSpan(
                                                  text:
                                                      "${checkInData[index]['time']}",
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                  ))
                                            ]))
                                      ],
                                    )
                                  ],
                                ),
                                trailing: Icon(
                                  Icons.location_searching_outlined,
                                  color: Colors.indigo[900],
                                ),
                              ),
                            ),
                            if (index == checkInData.length - 1)
                              Container()
                            else
                              const Positioned(
                                  top: 38,
                                  left: 50.5,
                                  child: SizedBox(
                                    width: 10,
                                    height: 50,
                                    child: VerticalDivider(
                                      indent: 2,
                                      width: 20,
                                      thickness: 1,
                                      color: Colors.grey,
                                    ),
                                  ))
                          ],
                        );
                      }),
                ),
                // Stack(
                //   clipBehavior: Clip.none,
                //   children: [
                //     Container(
                //       height: 64,
                //       child: ListTile(
                //         contentPadding: const EdgeInsets.fromLTRB(17, 4, 32, 4),
                //         leading: Row(
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             const Text("CP1"),
                //             Padding(
                //               padding: const EdgeInsets.only(left: 12, right: 30),
                //               child: Container(
                //                 height: 8,
                //                 width: 8,
                //                 decoration: BoxDecoration(
                //                     color: Colors.green,
                //                     borderRadius: BorderRadius.circular(50)),
                //               ),
                //             )
                //           ],
                //         ),
                //         title: Row(
                //           children: [
                //             const Padding(
                //               padding: EdgeInsets.only(top: 5),
                //               child: Image(
                //                   height: 30,
                //                   width: 30,
                //                   image: AssetImage("assets/barcode.png")),
                //             ),
                //             const SizedBox(
                //               width: 4,
                //             ),
                //             Column(
                //               mainAxisSize: MainAxisSize.min,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   "Radission Blu Hotel 1",
                //                   style: TextStyle(color: Colors.indigo[900]),
                //                 ),
                //                 RichText(
                //                     text: const TextSpan(
                //                         text: "Check-in:",
                //                         style: TextStyle(
                //                             color: Colors.black,
                //                             fontSize: 10,
                //                             fontWeight: FontWeight.w600),
                //                         children: [
                //                       TextSpan(
                //                           text: "10:00 AM",
                //                           style: TextStyle(
                //                             color: Colors.green,
                //                             fontSize: 10,
                //                             fontWeight: FontWeight.w600,
                //                           ))
                //                     ]))
                //               ],
                //             )
                //           ],
                //         ),
                //         trailing: Icon(
                //           Icons.location_searching_outlined,
                //           color: Colors.indigo[900],
                //         ),
                //       ),
                //     ),
                //     const Positioned(
                //         top: 38,
                //         left: 50,
                //         child: SizedBox(
                //           width: 10,
                //           height: 50,
                //           child: VerticalDivider(
                //             indent: 2,
                //             width: 20,
                //             thickness: 1,
                //             color: Colors.grey,
                //           ),
                //         ))
                //   ],
                // ),
                // Stack(
                //   clipBehavior: Clip.none,
                //   children: [
                //     Container(
                //       height: 64,
                //       child: ListTile(
                //         contentPadding: const EdgeInsets.fromLTRB(16, 4, 32, 4),
                //         leading: Row(
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             const Text("CP2"),
                //             Padding(
                //               padding:
                //                   const EdgeInsets.only(left: 11.5, right: 30),
                //               child: Container(
                //                 height: 8,
                //                 width: 8,
                //                 decoration: BoxDecoration(
                //                     color: Colors.red,
                //                     borderRadius: BorderRadius.circular(50)),
                //               ),
                //             )
                //           ],
                //         ),
                //         title: Row(
                //           children: [
                //             const Padding(
                //               padding: EdgeInsets.only(top: 5),
                //               child: Image(
                //                   height: 30,
                //                   width: 30,
                //                   image: AssetImage("assets/barcode.png")),
                //             ),
                //             const SizedBox(
                //               width: 4,
                //             ),
                //             Column(
                //               mainAxisSize: MainAxisSize.min,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   "Radission Blu Hotel 1",
                //                   style: TextStyle(color: Colors.indigo[900]),
                //                 ),
                //                 RichText(
                //                     text: const TextSpan(
                //                   text: "Missed:",
                //                   style: TextStyle(
                //                       color: Colors.red,
                //                       fontSize: 10,
                //                       fontWeight: FontWeight.w600),
                //                 ))
                //               ],
                //             )
                //           ],
                //         ),
                //         trailing: Icon(
                //           Icons.location_searching_outlined,
                //           color: Colors.indigo[900],
                //         ),
                //       ),
                //     ),
                //     const Positioned(
                //         top: 38,
                //         left: 50,
                //         child: SizedBox(
                //           width: 10,
                //           height: 50,
                //           child: VerticalDivider(
                //             indent: 2,
                //             width: 20,
                //             thickness: 1,
                //             color: Colors.grey,
                //           ),
                //         ))
                //   ],
                // ),
                // Stack(
                //   clipBehavior: Clip.none,
                //   children: [
                //     Container(
                //       height: 64,
                //       child: ListTile(
                //         contentPadding: const EdgeInsets.fromLTRB(16, 4, 32, 4),
                //         leading: Row(
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             const Text("CP3"),
                //             Padding(
                //               padding:
                //                   const EdgeInsets.only(left: 11.5, right: 30),
                //               child: Container(
                //                 height: 8,
                //                 width: 8,
                //                 decoration: BoxDecoration(
                //                     color: Colors.green,
                //                     borderRadius: BorderRadius.circular(50)),
                //               ),
                //             )
                //           ],
                //         ),
                //         title: Row(
                //           children: [
                //             const Padding(
                //               padding: EdgeInsets.only(top: 5),
                //               child: Image(
                //                   height: 30,
                //                   width: 30,
                //                   image: AssetImage("assets/barcode.png")),
                //             ),
                //             const SizedBox(
                //               width: 4,
                //             ),
                //             Column(
                //               mainAxisSize: MainAxisSize.min,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   "Radission Blu Hotel 1",
                //                   style: TextStyle(color: Colors.indigo[900]),
                //                 ),
                //                 RichText(
                //                     text: const TextSpan(
                //                         text: "Check-in:",
                //                         style: TextStyle(
                //                             color: Colors.black,
                //                             fontSize: 10,
                //                             fontWeight: FontWeight.w600),
                //                         children: [
                //                       TextSpan(
                //                           text: "10:00 AM",
                //                           style: TextStyle(
                //                             color: Colors.green,
                //                             fontSize: 10,
                //                             fontWeight: FontWeight.w600,
                //                           ))
                //                     ]))
                //               ],
                //             )
                //           ],
                //         ),
                //         trailing: Icon(
                //           Icons.location_searching_outlined,
                //           color: Colors.indigo[900],
                //         ),
                //       ),
                //     ),
                //     const Positioned(
                //         top: 38,
                //         left: 50,
                //         child: SizedBox(
                //           width: 10,
                //           height: 50,
                //           child: VerticalDivider(
                //             width: 20,
                //             thickness: 1,
                //             color: Colors.grey,
                //           ),
                //         ))
                //   ],
                // ),
                // Stack(
                //   clipBehavior: Clip.none,
                //   children: [
                //     Container(
                //       height: 64,
                //       child: ListTile(
                //         contentPadding: const EdgeInsets.fromLTRB(16, 4, 32, 4),
                //         leading: Row(
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             const Text("CP4"),
                //             Padding(
                //                 padding:
                //                     const EdgeInsets.only(left: 8.5, right: 30),
                //                 child: Icon(
                //                   Icons.radio_button_checked,
                //                   color: Colors.indigo[900],
                //                   size: 14,
                //                   shadows: const [
                //                     Shadow(
                //                       color: Colors.blue,
                //                       blurRadius: 7,
                //                     )
                //                   ],
                //                 ))
                //           ],
                //         ),
                //         title: Row(
                //           children: [
                //             const Padding(
                //               padding: EdgeInsets.only(top: 5),
                //               child: Image(
                //                   height: 30,
                //                   width: 30,
                //                   image: AssetImage("assets/barcode.png")),
                //             ),
                //             const SizedBox(
                //               width: 4,
                //             ),
                //             Column(
                //               mainAxisSize: MainAxisSize.min,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   "Radission Blu Hotel 1",
                //                   style: TextStyle(color: Colors.indigo[900]),
                //                 ),
                //                 RichText(
                //                     text: const TextSpan(
                //                         text: "Check-in:",
                //                         style: TextStyle(
                //                             color: Colors.black,
                //                             fontSize: 10,
                //                             fontWeight: FontWeight.w600),
                //                         children: [
                //                       TextSpan(
                //                           text: "10:00 AM",
                //                           style: TextStyle(
                //                             color: Colors.green,
                //                             fontSize: 10,
                //                             fontWeight: FontWeight.w600,
                //                           ))
                //                     ]))
                //               ],
                //             )
                //           ],
                //         ),
                //         trailing: Icon(
                //           Icons.location_searching_outlined,
                //           color: Colors.indigo[900],
                //         ),
                //       ),
                //     ),
                //     const Positioned(
                //         top: 38,
                //         left: 50,
                //         child: SizedBox(
                //           width: 10,
                //           height: 50,
                //           child: VerticalDivider(
                //             indent: 2,
                //             width: 20,
                //             thickness: 1,
                //             color: Colors.grey,
                //           ),
                //         ))
                //   ],
                // ),
                // Stack(
                //   clipBehavior: Clip.none,
                //   children: [
                //     Container(
                //       height: 64,
                //       child: ListTile(
                //         contentPadding: const EdgeInsets.fromLTRB(16, 4, 32, 4),
                //         leading: Row(
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             const Text("CP5"),
                //             Padding(
                //               padding:
                //                   const EdgeInsets.only(left: 11.5, right: 30),
                //               child: Container(
                //                 height: 8,
                //                 width: 8,
                //                 decoration: BoxDecoration(
                //                     color: Colors.green,
                //                     borderRadius: BorderRadius.circular(50)),
                //               ),
                //             )
                //           ],
                //         ),
                //         title: Row(
                //           children: [
                //             const Padding(
                //               padding: EdgeInsets.only(top: 5),
                //               child: Image(
                //                   height: 30,
                //                   width: 30,
                //                   image: AssetImage("assets/barcode.png")),
                //             ),
                //             const SizedBox(
                //               width: 4,
                //             ),
                //             Column(
                //               mainAxisSize: MainAxisSize.min,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   "Radission Blu Hotel 1",
                //                   style: TextStyle(color: Colors.indigo[900]),
                //                 ),
                //                 RichText(
                //                     text: const TextSpan(
                //                         text: "Check-in:",
                //                         style: TextStyle(
                //                             color: Colors.black,
                //                             fontSize: 10,
                //                             fontWeight: FontWeight.w600),
                //                         children: [
                //                       TextSpan(
                //                           text: "10:00 AM",
                //                           style: TextStyle(
                //                             color: Colors.green,
                //                             fontSize: 10,
                //                             fontWeight: FontWeight.w600,
                //                           ))
                //                     ]))
                //               ],
                //             )
                //           ],
                //         ),
                //         trailing: Icon(
                //           Icons.location_searching_outlined,
                //           color: Colors.indigo[900],
                //         ),
                //       ),
                //     ),
                //     const Positioned(
                //         top: 38,
                //         left: 50,
                //         child: SizedBox(
                //           width: 10,
                //           height: 50,
                //           child: VerticalDivider(
                //             width: 20,
                //             thickness: 1,
                //             color: Colors.grey,
                //           ),
                //         ))
                //   ],
                // ),
                // Stack(
                //   clipBehavior: Clip.none,
                //   children: [
                //     Container(
                //       height: 64,
                //       child: ListTile(
                //         contentPadding: const EdgeInsets.fromLTRB(16, 4, 32, 4),
                //         leading: Row(
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             const Text("CP6"),
                //             Padding(
                //               padding:
                //                   const EdgeInsets.only(left: 11.5, right: 30),
                //               child: Container(
                //                 height: 8,
                //                 width: 8,
                //                 decoration: BoxDecoration(
                //                     color: Colors.green,
                //                     borderRadius: BorderRadius.circular(50)),
                //               ),
                //             )
                //           ],
                //         ),
                //         title: Row(
                //           children: [
                //             const Padding(
                //               padding: EdgeInsets.only(top: 5),
                //               child: Image(
                //                   height: 30,
                //                   width: 30,
                //                   image: AssetImage("assets/barcode.png")),
                //             ),
                //             const SizedBox(
                //               width: 4,
                //             ),
                //             Column(
                //               mainAxisSize: MainAxisSize.min,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   "Radission Blu Hotel 1",
                //                   style: TextStyle(color: Colors.indigo[900]),
                //                 ),
                //                 RichText(
                //                     text: const TextSpan(
                //                         text: "Check-in:",
                //                         style: TextStyle(
                //                             color: Colors.black,
                //                             fontSize: 10,
                //                             fontWeight: FontWeight.w600),
                //                         children: [
                //                       TextSpan(
                //                           text: "10:00 AM",
                //                           style: TextStyle(
                //                             color: Colors.green,
                //                             fontSize: 10,
                //                             fontWeight: FontWeight.w600,
                //                           ))
                //                     ]))
                //               ],
                //             )
                //           ],
                //         ),
                //         trailing: Icon(
                //           Icons.location_searching_outlined,
                //           color: Colors.indigo[900],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(211, 219, 232, 1),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.fromLTRB(16, 4, 32, 4),
                      leading: Padding(
                        padding: const EdgeInsets.only(right: 21),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.indigo[900],
                              borderRadius: BorderRadius.circular(50)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock_clock_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "End",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                      title: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Image(
                                height: 30,
                                width: 30,
                                image: AssetImage("assets/barcode.png")),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Radission Blu Hotel 1",
                                style: TextStyle(color: Colors.indigo[900]),
                              ),
                              RichText(
                                  text: const TextSpan(
                                      text: "Clock-out:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                      children: [
                                    TextSpan(
                                        text: "10:00 AM",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]))
                            ],
                          )
                        ],
                      ),
                      trailing: Icon(
                        Icons.location_searching_outlined,
                        color: Colors.indigo[900],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
