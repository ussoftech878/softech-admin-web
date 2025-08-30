import 'dart:ui'; // Add this import for ImageFilter
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:softech_admin/routes/router_config.dart';
import 'package:softech_admin/utils/images.dart';
import 'package:softech_admin/utils/theme.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key, required this.child});

  final Widget child;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with blur
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(PngAssests.background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0, // Adjust blur intensity
              sigmaY: 5.0,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.1), // Adjust overlay opacity
            ),
          ),
          // Main content
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 50.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                height: 250.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        //context.replace(homeRoute);
                      },
                      child: Image.asset(PngAssests.logo, width: 160.w),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 108.w),
                      child: Row(
                        children: [
                          _buildNavItem(context, "Employees", EmployeeRoute),
                          SizedBox(width: 30.w),
                          _buildNavItem(context, 'attendance', AttendanceRoute),
                          SizedBox(width: 30.w),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 40.w),
                      child: Row(
                        children: [
                          /* InkWell(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color(0xFFD1D5DB)),
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(200.r),
                                              ),
                                              width: 110.w,
                                              height: 40.w,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.w),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      width: 25.w,
                                                      PngAssets.Flag_of_United_States,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Text(
                                                      "Eng",
                                                      style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight: FontWeight.w500,
                                                        color: AppColors.kTextColor,
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Image.asset(PngAssets
                                                        .keyboard_arrow_down),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ), */
                          SizedBox(width: 20.w),
                          // PopupMenuButton(
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       border: Border.all(
                          //           color: Color(0xFFD1D5DB)),
                          //       color: Colors.transparent,
                          //       borderRadius:
                          //           BorderRadius.circular(200.r),
                          //     ),
                          //     width: 110.w,
                          //     height: 40.w,
                          //     child: Padding(
                          //       padding: EdgeInsets.all(8.w),
                          //       child: Row(
                          //         children: [
                          //           Image.asset(
                          //             width: 25.w,
                          //             PngAssets.Flag_of_United_States,
                          //           ),
                          //           SizedBox(width: 5.w),
                          //           Text(
                          //             mainViewModel.getLanguage,
                          //             style: TextStyle(
                          //               fontSize: 16.sp,
                          //               fontWeight: FontWeight.w500,
                          //               color: AppColors.kTextColor,
                          //             ),
                          //           ),
                          //           Spacer(),
                          //           Image.asset(PngAssets
                          //               .keyboard_arrow_down),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          //   itemBuilder: (context) => [
                          //     PopupMenuItem(
                          //       child: Text("English"),
                          //       onTap: () {
                          //         mainViewModel.setLanguage("Eng");
                          //       },
                          //     ),
                          //     PopupMenuItem(
                          //       child: Text("Norwegian"),
                          //       onTap: () {
                          //         mainViewModel.setLanguage("Nor");
                          //       },
                          //     ),
                          //   ],
                          // ),
                          SizedBox(width: 20.w),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: widget.child),
            ],
          ),
        ],
      ),
    );
  }

  void _handleNavigation(BuildContext context, String route) {
    context.go(route);
  }

  Widget _buildNavItem(BuildContext context, String title, String route) {
    // Get current location from GoRouter
    final currentLocation = GoRouterState.of(context).matchedLocation;
    final isSelected = currentLocation == route;

    return InkWell(
      onTap: () => _handleNavigation(context, route),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppColors.white : AppColors.dullwhite,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
