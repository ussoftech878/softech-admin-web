import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softech_admin/utils/theme.dart';

class BookingTile extends StatelessWidget {
  final Color color;
  final Icon icon;
  // final bool isEvenRow;
  const BookingTile({super.key, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      padding: EdgeInsets.symmetric(vertical: 6.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.r),
          bottomRight: Radius.circular(50.r),
        ),
        color: color,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 94.w,
            child: Text(
              '#12345',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(
            width: 203.w,
            child: Row(
              children: [
                SizedBox(width: 10.w),
                Text(
                  "Usama",
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 133.33.w,
            child: Text(
              'ABCD',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 157.w,
            child: Text(
              'XYZ123',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 133.33.w,
            child: Text(
              'Valid',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 133.33.w,
            child: Text(
              '2023-10-01',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 133.33.w,
            child: Text(
              '2023-10-15',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 133.33.w,
            child: Text(
              '1500 KM',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 133.33.w,
            child: Row(
              children: [
                Text(
                  '2000 KM',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                // Get.toNamed(AvailableCarsDetailScreen.routeName);
              },
              child: icon,
            ),
          ),
        ],
      ),
    );
  }
}
