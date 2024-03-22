import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:form_login/sgt_pages/progress_bar.dart';

class Properties extends StatefulWidget {
  const Properties({super.key});

  @override
  State<Properties> createState() => _PropertiesState();
}

class _PropertiesState extends State<Properties> {
  bool _isVisible = true;

  List<Map<dynamic, dynamic>> propertiesData = [
    {
      'banner': 'Create Shift',
      'image': 'assets/propertiesImage1.jpeg',
      'property-name': 'Radission Blue Hotel',
      'property-type': 'Residential Property',
      'property-details':
          'This is a Property description: area where in person can write basic...',
      'location': 'Lucknow'
    },
    {
      'banner': 'Assign a Guard',
      'image': 'assets/propertiesImage2.jpeg',
      'property-name': 'Radission Blue Hotel',
      'property-type': 'Residential Property',
      'property-details':
          'This is a Property description: area where in person can write basic...',
      'location': 'Lucknow'
    },
    {
      'banner': 'Create Checkpoint',
      'image': 'assets/propertiesImage3.jpeg',
      'property-name': 'Radission Blue Hotel',
      'property-type': 'Residential Property',
      'property-details':
          'This is a Property description: area where in person can write basic...',
      'location': 'Lucknow'
    },
    {
      'banner': 'Create Checkpoint',
      'image': 'assets/propertiesImage4.jpeg',
      'property-name': 'Radission Blue Hotel',
      'property-type': 'Residential Property',
      'property-details':
          'This is a Property description: area where in person can write basic...',
      'location': 'Lucknow'
    },
    {
      'banner': 'Create Shift',
      'image': 'assets/propertiesImage5.jpeg',
      'property-name': 'Radission Blue Hotel',
      'property-type': 'Residential Property',
      'property-details':
          'This is a Property description: area where in person can write basic...',
      'location': 'Lucknow'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 63.h,
          centerTitle: false,
          title: Text(
            "Properties",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
          ),
          actions: [
            Icon(
              Icons.search_sharp,
              color: Colors.indigo[900],
              size: 15.34.w,
            ),
            SizedBox(
              width: 30.w,
            ),
            Icon(
              Icons.notifications_active,
              color: Colors.indigo[900],
              size: 15.34.w,
            ),
            SizedBox(
              width: 30.w,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.cover,
                  image: const AssetImage('assets/propertiesProfile.jpeg')),
            ),
            SizedBox(
              width: 16.w,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,

              //============>top container
              children: [
                Container(
                  height: 72.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.indigo[900]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: const Row(
                      children: [],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Recently Added",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 12.h,
                ),

                //=============> Carousel Slider
                CarouselSlider.builder(
                    itemCount: propertiesData.length,
                    itemBuilder: (context, index, _) {
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 120.76.w,
                                    height: 117.h,
                                    child: Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            propertiesData[index]['image'])),
                                  ),
                                  Center(
                                    child: Container(
                                      width: 95.w,
                                      height: 86.h,
                                      decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          propertiesData[index]['banner'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              Flexible(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(
                                        propertiesData[index]['property-name'],
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.indigo[900]),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text(
                                        propertiesData[index]['property-type'],
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text(
                                        propertiesData[index]
                                            ['property-details'],
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.place,
                                                size: 16.h,
                                                color: Colors.indigo[900],
                                              ),
                                              SizedBox(
                                                width: 5.5.w,
                                              ),
                                              Text(
                                                propertiesData[index]
                                                    ['location'],
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.indigo[900]),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            height: 8,
                                            child: IconButton(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                onPressed: () {
                                                  setState(() {
                                                    _isVisible = !_isVisible;
                                                  });
                                                },
                                                icon: _isVisible
                                                    ? Icon(
                                                        Icons.expand_more,
                                                        size: 14.h,
                                                      )
                                                    : Icon(
                                                        Icons.expand_less,
                                                        size: 14.h,
                                                      )),
                                          ),
                                        ],
                                      )
                                    ]),
                              )
                            ],
                          ),
                          Visibility(
                              visible: _isVisible,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0.w),
                                    child: const ProgressBar(currentIndex: 0),
                                  )
                                ],
                              )),
                        ],
                      );
                    },
                    options: CarouselOptions(
                        enlargeFactor: 0.5,
                        viewportFraction: 1,
                        enableInfiniteScroll: false,
                        clipBehavior: Clip.none,
                        height: _isVisible ? 238.h : 117.h)),

                Flexible(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 30),
                  child: TextButton(
                    child: Text(
                      "Home Page",
                      style: TextStyle(fontSize: 20, color: Colors.indigo[900]),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
