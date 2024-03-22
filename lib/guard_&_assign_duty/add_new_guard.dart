import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_login/styles/colors.dart';
import 'package:get/route_manager.dart';

class AddNewGuard extends StatelessWidget {
  const AddNewGuard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          toolbarHeight: 63.h,
        ),
        body: Container(
          color: AppColors.backgroundColor,
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Guard",
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "+Assign Duty",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          width: 168.w, image: const AssetImage('assets/ang-1.png')),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'No Guards Added',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: AppColors.white,
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r)),
                              fixedSize: Size(190.w, 38.h)),
                          onPressed: () {
                            Get.toNamed('ProfilePage');
                          },
                          child: Text(
                            "+ Add New Guard",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
