import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softech_admin/utils/theme.dart';
import 'package:softech_admin/widgets/custom_outline_button.dart';
import 'package:softech_admin/widgets/gradient_button.dart';

void showAddEmployeeDialogBox(BuildContext context) {
  showDialog(
      barrierColor: Color.fromRGBO(1, 89, 121, 0.50),
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 675.w),
            child: Padding(
              padding: EdgeInsets.all(30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Employee',
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xffA6A6A6),
                      )
                     
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Employee ID',
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xffA6A6A6),
                      )
                     
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'email',
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xffA6A6A6),
                      )
                     
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'department',
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xffA6A6A6),
                      )
                     
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'role',
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xffA6A6A6),
                      )
                     
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 52.w,
                          width: 122.w,
                          child: CustomOutlineButton(
                              text: 'Cancel', onPressed: () {
                            Navigator.pop(context);
                              })),
                      SizedBox(
                          height: 50.w,
                          width: 150.w,
                          child: GradientButton(text: 'Add', onPressed: () {
                            Navigator.pop(context);
                          }))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
      });
}

