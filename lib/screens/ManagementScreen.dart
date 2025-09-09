import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softech_admin/utils/theme.dart';

class Managementscreen extends StatelessWidget {
  const Managementscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      //
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Leave Management',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 20.h),

            // Add Month Filter Dropdown
            SizedBox(height: 20.h),

            // Existing attendance table content
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30.w),
                height: double.infinity,

                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          final bool isEvenRow = index % 2 == 0;
                          final textColor = isEvenRow
                              ? AppColors.black
                              : AppColors.white;
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 10.w),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 15.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: isEvenRow
                                  ? AppColors.white
                                  : AppColors.teal,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Text(
                                    'leave notice will be given here',
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: textColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 3.w),
                                SizedBox(
                                  child: Text(
                                    'leave type will be given here',
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: textColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 3.w),
                                SizedBox(
                                  width: 150.w,
                                  child: Text(
                                    'Accepted',
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: textColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 3.w),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
