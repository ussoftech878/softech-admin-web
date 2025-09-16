import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 30.h),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 400.h,
                    width: 400.w,
                    child: CircleAvatar(
                      radius: 60.r,
                      backgroundImage: const AssetImage('assets/profile.png'),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Software Engineer',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            ProfileInfoCard(
              title: 'Personal Information',
              children: [
                ProfileInfoItem(label: 'Email', value: 'john.doe@softech.com'),
                ProfileInfoItem(label: 'Phone', value: '+1 234 567 890'),
                ProfileInfoItem(label: 'Department', value: 'IT'),
                ProfileInfoItem(label: 'Employee ID', value: 'EMP001'),
              ],
            ),
            SizedBox(height: 20.h),
            ProfileInfoCard(
              title: 'Work Information',
              children: [
                ProfileInfoItem(label: 'Join Date', value: '01/01/2023'),
                ProfileInfoItem(label: 'Status', value: 'Active'),
                ProfileInfoItem(label: 'Experience', value: '5 years'),
                ProfileInfoItem(label: 'Location', value: 'New York'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ProfileInfoCard({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15.h),
          ...children,
        ],
      ),
    );
  }
}

class ProfileInfoItem extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfoItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}