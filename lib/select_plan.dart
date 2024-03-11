import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectPlan extends StatefulWidget {
  const SelectPlan({super.key});

  @override
  State<SelectPlan> createState() => _SelectPlanState();
}

class _SelectPlanState extends State<SelectPlan> {
  // List<Map<dynamic, dynamic>> selectPlanData = [
  //   {
  //     'icon-color': 'grey',
  //     'plan-name': 'Silver',
  //     'plan-detail': 'Optimal  For 10+ team size and new startup',
  //     'plan-price': '100',
  //     'plan-duration': 'month',
  //   }
  // ];
  bool isChecked = true;

  bool isSelected = true;
  int? valueTab = 0;

  List<dynamic> checkboxSilverMonthly = [
    {'title': '5 Properties', 'value': false},
    {'title': '10 Shifts', 'value': false},
    {'title': '10 Checkpoints', 'value': false},
    {'title': '10 Guards', 'value': false},
    {'title': 'Messanger', 'value': false}
  ];
  List<dynamic> checkboxGoldMonthly = [
    {'title': '5 Properties', 'value': false},
    {'title': '10 Shifts', 'value': false},
    {'title': '10 Checkpoints', 'value': false},
    {'title': '10 Guards', 'value': false},
    {'title': 'Messanger', 'value': false}
  ];
  List<dynamic> checkboxPlatinumMonthly = [
    {'title': '5 Properties', 'value': false},
    {'title': '10 Shifts', 'value': false},
    {'title': '10 Checkpoints', 'value': false},
    {'title': '10 Guards', 'value': false},
    {'title': 'Messanger', 'value': false}
  ];
  List<dynamic> checkboxSilverYearly = [
    {'title': '5 Properties', 'value': false},
    {'title': '10 Shifts', 'value': false},
    {'title': '10 Checkpoints', 'value': false},
    {'title': '10 Guards', 'value': false},
    {'title': 'Messanger', 'value': false}
  ];
  List<dynamic> checkboxGoldYearly = [
    {'title': '5 Properties', 'value': false},
    {'title': '10 Shifts', 'value': false},
    {'title': '10 Checkpoints', 'value': false},
    {'title': '10 Guards', 'value': false},
    {'title': 'Messanger', 'value': false}
  ];
  List<dynamic> checkboxPlatinumYearly = [
    {'title': '5 Properties', 'value': false},
    {'title': '10 Shifts', 'value': false},
    {'title': '10 Checkpoints', 'value': false},
    {'title': '10 Guards', 'value': false},
    {'title': 'Messanger', 'value': false}
  ];

  TabBar get _tabBar => TabBar(
          onTap: (value) {
            setState(() {
              valueTab = value;
            });
          },
          labelPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
          tabAlignment: TabAlignment.center,
          labelStyle: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w500,
          ),
          labelColor: Colors.white,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          padding: EdgeInsets.all(2.h),
          tabs: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color:
                      valueTab == 0 ? Colors.indigo[900] : Colors.transparent,
                ),
                alignment: Alignment.center,
                width: 160.w,
                height: 28.h,
                child: const Text(
                  "Monthly  ",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color:
                      valueTab == 1 ? Colors.indigo[900] : Colors.transparent,
                ),
                alignment: Alignment.center,
                width: 160.w,
                height: 28.h,
                child: const Text(
                  "Yearly  ",
                ),
              ),
            ),
          ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
              backgroundColor: Color.fromRGBO(245, 246, 249, 1),
              appBar: AppBar(
                elevation: 5,
                backgroundColor: Colors.white,
                shadowColor: Color.fromRGBO(0, 0, 0, 0.466),
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                centerTitle: false,
                titleSpacing: 0,
                title: Text(
                  "SelectPlan",
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
                ),
              ),
              body: Column(
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 32.h,
                    child: PreferredSize(
                        preferredSize: _tabBar.preferredSize,
                        child: Material(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 204, 204, 204),
                          child: _tabBar,
                        )),
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: CarouselSlider(
                              items: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(7.r)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.w, vertical: 8.h),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 24.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.indigo[900],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40)),
                                                child: const Image(
                                                    image: AssetImage(
                                                        'assets/vector.png')),
                                              ),
                                              SizedBox(
                                                width: 6.w,
                                              ),
                                              Text(
                                                "Silver",
                                                style: TextStyle(
                                                    fontSize: 22.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w),
                                            child: Text(
                                              "Optimal  For 10+ team size and new startup",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16.h,
                                          ),
                                          RichText(
                                              text: TextSpan(
                                                  text: '\$100',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 24.h,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  children: [
                                                TextSpan(
                                                  text: "/mo",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.h,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ])),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Flexible(
                                            child: ListView.builder(
                                                itemCount: checkboxSilverMonthly
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      CheckboxListTile(
                                                        title: Text(
                                                          checkboxSilverMonthly[
                                                              index]['title'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14.h,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        checkboxShape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50.r)),
                                                        value:
                                                            checkboxSilverMonthly[
                                                                index]['value'],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            checkboxSilverMonthly[
                                                                        index]
                                                                    ['value'] =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 16.h,
                                                      ),
                                                    ],
                                                  );
                                                }),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(7.r)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.w, vertical: 8.h),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 24.w,
                                                // height: 24.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.yellow[800],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.r)),
                                                child: const Image(
                                                    image: AssetImage(
                                                        'assets/vector.png')),
                                              ),
                                              SizedBox(
                                                width: 6.w,
                                              ),
                                              Text(
                                                "Gold",
                                                style: TextStyle(
                                                    fontSize: 22.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w),
                                            child: Text(
                                              "Optimal  For 10+ team size and new startup",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16.h,
                                          ),
                                          RichText(
                                              text: TextSpan(
                                                  text: '\$100',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 24.h,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  children: [
                                                TextSpan(
                                                  text: "/mo",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.h,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ])),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Flexible(
                                            child: ListView.builder(
                                                itemCount:
                                                    checkboxGoldMonthly.length,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      CheckboxListTile(
                                                        title: Text(
                                                          checkboxGoldMonthly[
                                                              index]['title'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14.h,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        checkboxShape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50.r)),
                                                        value:
                                                            checkboxGoldMonthly[
                                                                index]['value'],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            checkboxGoldMonthly[
                                                                        index]
                                                                    ['value'] =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 16.h,
                                                      ),
                                                    ],
                                                  );
                                                }),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(7.r)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.w, vertical: 8.h),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 24.w,
                                                // height: 24.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40)),
                                                child: const Image(
                                                    image: AssetImage(
                                                        'assets/vector.png')),
                                              ),
                                              SizedBox(
                                                width: 6.w,
                                              ),
                                              Text(
                                                "Plantinum",
                                                style: TextStyle(
                                                    fontSize: 22.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w),
                                            child: Text(
                                              "Optimal  For 10+ team size and new startup",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16.h,
                                          ),
                                          RichText(
                                              text: TextSpan(
                                                  text: '\$100',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 24.h,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  children: [
                                                TextSpan(
                                                  text: "/mo",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.h,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ])),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Flexible(
                                            child: ListView.builder(
                                                itemCount:
                                                    checkboxPlatinumMonthly
                                                        .length,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      CheckboxListTile(
                                                        title: Text(
                                                          checkboxPlatinumMonthly[
                                                              index]['title'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14.h,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        checkboxShape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50.r)),
                                                        value:
                                                            checkboxPlatinumMonthly[
                                                                index]['value'],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            checkboxPlatinumMonthly[
                                                                        index]
                                                                    ['value'] =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 16.h,
                                                      ),
                                                    ],
                                                  );
                                                }),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              options: CarouselOptions(
                                  height: 417.h,
                                  enableInfiniteScroll: false,
                                  viewportFraction: 0.8)),
                        ),
                      ),
                      SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: CarouselSlider(
                              items: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(7.r)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.w, vertical: 8.h),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 24.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.indigo[900],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40)),
                                                child: const Image(
                                                    image: AssetImage(
                                                        'assets/vector.png')),
                                              ),
                                              SizedBox(
                                                width: 6.w,
                                              ),
                                              Text(
                                                "Silver",
                                                style: TextStyle(
                                                    fontSize: 22.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w),
                                            child: Text(
                                              "Optimal  For 10+ team size and new startup",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16.h,
                                          ),
                                          RichText(
                                              text: TextSpan(
                                                  text: '\$100',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 24.h,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  children: [
                                                TextSpan(
                                                  text: "/yr",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.h,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ])),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Flexible(
                                            child: ListView.builder(
                                                itemCount:
                                                    checkboxSilverYearly.length,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      CheckboxListTile(
                                                        title: Text(
                                                          checkboxSilverYearly[
                                                              index]['title'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14.h,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        checkboxShape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50)),
                                                        value:
                                                            checkboxSilverYearly[
                                                                index]['value'],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            checkboxSilverYearly[
                                                                        index]
                                                                    ['value'] =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 16.h,
                                                      ),
                                                    ],
                                                  );
                                                }),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(7.r)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.w, vertical: 8.h),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 24.w,
                                                // height: 24.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.yellow[800],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40)),
                                                child: const Image(
                                                    image: AssetImage(
                                                        'assets/vector.png')),
                                              ),
                                              SizedBox(
                                                width: 6.w,
                                              ),
                                              Text(
                                                "Gold",
                                                style: TextStyle(
                                                    fontSize: 22.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w),
                                            child: Text(
                                              "Optimal  For 10+ team size and new startup",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16.h,
                                          ),
                                          RichText(
                                              text: TextSpan(
                                                  text: '\$100',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 24.h,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  children: [
                                                TextSpan(
                                                  text: "/yr",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.h,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ])),
                                          SizedBox(
                                            height: 16.h,
                                          ),
                                          Flexible(
                                            child: ListView.builder(
                                                itemCount:
                                                    checkboxGoldYearly.length,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      CheckboxListTile(
                                                        title: Text(
                                                          checkboxGoldYearly[
                                                              index]['title'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14.h,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        checkboxShape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50)),
                                                        value:
                                                            checkboxGoldYearly[
                                                                index]['value'],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            checkboxGoldYearly[
                                                                        index]
                                                                    ['value'] =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 16.h,
                                                      ),
                                                    ],
                                                  );
                                                }),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(7.r)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.w, vertical: 8.h),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 24.w,
                                                // height: 24.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40)),
                                                child: const Image(
                                                    image: AssetImage(
                                                        'assets/vector.png')),
                                              ),
                                              SizedBox(
                                                width: 6.w,
                                              ),
                                              Text(
                                                "Plantinum",
                                                style: TextStyle(
                                                    fontSize: 22.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w),
                                            child: Text(
                                              "Optimal  For 10+ team size and new startup",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16.h,
                                          ),
                                          RichText(
                                              text: TextSpan(
                                                  text: '\$100',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 24.h,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  children: [
                                                TextSpan(
                                                  text: "/yr",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.h,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ])),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Flexible(
                                            child: ListView.builder(
                                                itemCount:
                                                    checkboxPlatinumYearly
                                                        .length,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      CheckboxListTile(
                                                        title: Text(
                                                          checkboxPlatinumYearly[
                                                              index]['title'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14.h,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        checkboxShape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50)),
                                                        value:
                                                            checkboxPlatinumYearly[
                                                                index]['value'],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            checkboxPlatinumYearly[
                                                                        index]
                                                                    ['value'] =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 16.h,
                                                      ),
                                                    ],
                                                  );
                                                }),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              options: CarouselOptions(
                                  height: 417.h,
                                  enableInfiniteScroll: false,
                                  viewportFraction: 0.8)),
                        ),
                      ),
                    ]),
                  ),
                ],
              )),
        ));
  }
}
