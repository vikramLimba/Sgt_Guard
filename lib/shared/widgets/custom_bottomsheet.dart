// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:form_login/styles/colors.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(32.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildHandle(context), child],
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.18,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 4.0,
        ),
        child: Column(
          children: [
            Container(
              height: 1.5,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.all(Radius.circular(2)),
              ),
            ),
            SizedBox(
              height: 3.5,
            ),
            Container(
              height: 1.5,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.all(Radius.circular(2)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
