
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomOutlineButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          // width: double.infinity,
          // height: 45,
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffA6A6A6)),
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
