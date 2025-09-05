import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softech_admin/utils/theme.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final double? fontsize;
  final VoidCallback onPressed;
  final Widget? icon;

  const GradientButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.icon,
      this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 180.h,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppColors.teal,
                  Colors.blue,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(100.r)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontsize ?? 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                icon ?? SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
