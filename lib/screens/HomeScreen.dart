import 'dart:ui'; // Add this import for ImageFilter
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:softech_admin/routes/router_config.dart';
import 'package:softech_admin/utils/images.dart';
import 'package:softech_admin/utils/theme.dart';
import 'package:softech_admin/widgets/showdialogbox.dart';
import 'package:url_launcher/url_launcher.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key, required this.child});

  final Widget child;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // Move _launchURL outside of build method
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Remove _launchURL from here
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
                      onTap: () async {
                        try {
                          await _launchURL('https://softecint.com/');
                        } catch (e) {
                          // Show error if URL fails to launch
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Could not open website')),
                            );
                          }
                        }
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
                          _buildNavItem(context, 'Management', ManagementRoute),
                          SizedBox(width: 30.w),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 40.w),
                      child: Row(
                        children: [
                          SizedBox(width: 20.w),
                          IconButton(
                            onPressed: () {
                              showNotificationDialogBox(context);
                            },
                            icon: Icon(
                              Icons.notifications,
                              color: AppColors.white,
                              size: 30.sp,
                            ),
                          ),
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
