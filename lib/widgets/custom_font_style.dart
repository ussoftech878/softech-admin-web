
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget red14w400({required String data}) {
  return Text(
    data,
    style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Colors.red),
  );
}
