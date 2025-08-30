import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softech_admin/utils/theme.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  List<String> employees = ["Ali", "Sara", "Usman"];
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  String selectedMonth = "August";

  // Sample attendance data
  final Map<String, Map<String, String>> attendance = {
    "2025-08-01": {"Ali": "P", "Sara": "A", "Usman": "P"},
    "2025-08-02": {"Ali": "L", "Sara": "P", "Usman": "A"},
    "2025-08-03": {"Ali": "P", "Sara": "P", "Usman": "P"},
    "2025-07-30": {"Ali": "A", "Sara": "P", "Usman": "P"},
  };

  List<String> getDatesForMonth(String month) {
    int monthIndex = months.indexOf(month) + 1;
    return attendance.keys.where((date) {
      DateTime dt = DateTime.parse(date);
      return dt.month == monthIndex;
    }).toList()..sort(); // sort dates
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "P":
        return Colors.green;
      case "A":
        return Colors.red;
      case "L":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredDates = getDatesForMonth(selectedMonth);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Attendance',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50.r),

                    border: Border.all(color: AppColors.primary, width: 3),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedMonth,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.primary,
                      ),
                      // Add these properties to remove hover effect
                      focusColor: Colors.transparent,
                      dropdownColor: Colors.white,
                      // Remove hover highlight
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      // Remove focus highlight
                      menuMaxHeight: 300,
                      underline: Container(),
                      // Remove button highlight
                      elevation: 2,
                      items: months.map((String month) {
                        return DropdownMenuItem<String>(
                          value: month,
                          child: Text(month),
                        );
                      }).toList(),

                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedMonth = newValue;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
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
                    BookingHeader(employees: employees),
                    Expanded(
                      child: filteredDates.isEmpty
                          ? Center(
                              child: Text(
                                'No attendance records for $selectedMonth',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: filteredDates.length,
                              itemBuilder: (context, index) {
                                final date = filteredDates[index];
                                final bool isEvenRow = index % 2 == 0;
                                return BookingTile(
                                  color: isEvenRow
                                      ? AppColors.white
                                      : AppColors.teal,
                                  textColor: isEvenRow
                                      ? AppColors.black
                                      : AppColors.white,
                                  date: date,
                                  dayAttendance: attendance[date]!,
                                  employees: employees,
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

class BookingTile extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String date;
  final Map<String, String> dayAttendance;
  final List<String> employees;

  const BookingTile({
    super.key,
    required this.color,
    required this.date,
    required this.dayAttendance,
    required this.employees,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.w),
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Date column
          SizedBox(
            width: 150.w,
            child: Text(
              date,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ),
          // Employee attendance columns
          ...employees
              .map(
                (employee) => SizedBox(
                  width: 120.w,
                  child: Text(
                    dayAttendance[employee] ?? '-',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              )
              .toList(),
          SizedBox(width: 3.w),
        ],
      ),
    );
  }
}

class BookingHeader extends StatelessWidget {
  final List<String> employees;

  const BookingHeader({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
      decoration: BoxDecoration(
        color: AppColors.teal,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Conditionally render date column
          SizedBox(
            width: 150.w,
            child: Text(
              'Date',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ),
          // Dynamic employee columns
          ...employees
              .map(
                (employee) => SizedBox(
                  width: 120.w,
                  child: Text(
                    employee,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              )
              .toList(),
          SizedBox(width: 3.w),
        ],
      ),
    );
  }
}
