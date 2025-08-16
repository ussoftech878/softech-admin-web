import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softech_admin/utils/theme.dart';

class BookingHeader extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final String text7;
  final String text8;
  final String text9;
  const BookingHeader({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
    required this.text8,
    required this.text9,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 94.w,
            child: Text(
              text1,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(
            width: 203.w,

            // flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text2,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 133.33.w,
            // flex: 2,
            child: Text(
              text3,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(
            width: 157.w,
            // flex: 2,
            child: Text(
              text4,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(
            width: 133.33.w,
            child: Text(
              text5,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(
            width: 133.33.w,
            child: Text(
              text6,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(
            width: 133.33.w,
            child: Text(
              maxLines: 1,
              text7,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(
            width: 133.33.w,
            child: Text(
              text8,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(
            width: 133.33.w,
            child: Text(
              text9,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(width: 3.w),
        ],
      ),
    );
  }
}
