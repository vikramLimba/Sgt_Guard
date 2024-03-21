import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_login/styles/colors.dart';

class NewGuardProgressBar extends StatefulWidget {
  const NewGuardProgressBar({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  State<NewGuardProgressBar> createState() => _NewGuardProgressBarState();
}

class _NewGuardProgressBarState extends State<NewGuardProgressBar> {
  late final int _currentIndex = widget.currentIndex;
  List<String> pages = ['Profile', 'Address', 'Id card', 'Password'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Row(
        children: [
          Flexible(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  final isCurrent = _currentIndex == index;

                  final isRecent = index < _currentIndex;
                  final color = isCurrent
                      ? AppColors.primaryColor
                      : isRecent
                          ? AppColors.primaryColor
                          : AppColors.primaryColor.withOpacity(0.4);
                  return Padding(
                    padding: EdgeInsets.only(left: 1.w),
                    child: Column(
                      children: [
                        Text(
                          pages[index],
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: color,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          width: 80.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
