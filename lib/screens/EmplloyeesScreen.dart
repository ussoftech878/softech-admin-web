import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softech_admin/utils/images.dart';
import 'package:softech_admin/utils/theme.dart';
import 'package:softech_admin/widgets/showdialogbox.dart';

class Emplloyeesscreen extends StatelessWidget {
  final List<Employee> employees = [
    Employee(
      id: 'EMP001',
      name: 'John Doe',
      email: 'john.doe@softech.com',
      department: 'IT',
      role: 'Software Engineer',
      status: 'Active',
    ),
    Employee(
      id: 'EMP002',
      name: 'Jane Smith',
      email: 'jane.smith@softech.com',
      department: 'HR',
      role: 'HR Manager',
      status: 'Active',
    ),
    Employee(
      id: 'EMP003',
      name: 'John Doe',
      email: 'john.doe@softech.com',
      department: 'IT',
      role: 'Software Engineer',
      status: 'Active',
    ),

    Employee(
      id: 'EMP003',
      name: 'John Doe',
      email: 'john.doe@softech.com',
      department: 'IT',
      role: 'Software Engineer',
      status: 'Active',
    ),
    // Add more employees as needed
  ];

  Emplloyeesscreen({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Employees',
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
                  child: InkWell(
                    onTap: () {
                      showAddEmployeeDialogBox(context);
                    },
                    child: Text(
                      'Add Employee',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
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
                    const BookingHeader(),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: employees.length,
                        itemBuilder: (context, index) {
                          final employee = employees[index];
                          final bool isEvenRow = index % 2 == 0;
                          return BookingTile(
                            color: isEvenRow ? AppColors.white : AppColors.teal,
                            textColor: isEvenRow
                                ? AppColors.black
                                : AppColors.white,
                            employee: employee,
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

class BookingHeader extends StatelessWidget {
  const BookingHeader({super.key});

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
              'Employee ID',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(width: 3.w),
          SizedBox(
            width: 150.w,
            child: Text(
              'Name',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(width: 3.w),
          SizedBox(
            width: 150.w,
            child: Text(
              'Email',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(width: 3.w),
          SizedBox(
            width: 150.w,
            child: Text(
              'Department',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(width: 3.w),
          SizedBox(
            width: 150.w,
            child: Text(
              'Role',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(width: 3.w),
          SizedBox(
            width: 150.w,
            child: Text(
              'Status',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookingTile extends StatelessWidget {
  final Color color;
  final Color textColor;
  final Employee employee;

  const BookingTile({
    super.key,
    required this.color,
    required this.employee,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 150.w,
            child: Text(
              employee.id,
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
              employee.name,
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
              employee.email,
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
              employee.department,
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
              employee.role,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          Text(
            employee.status,
            style: TextStyle(
              color: employee.status == 'Active' ? textColor : Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(width: 8.w),
          Switch(
            value: employee.status == 'Active',
            onChanged: (value) {
              // You need to handle state update in a StatefulWidget
              // This is just a placeholder for UI
            },
            activeColor: Colors.green,
            inactiveThumbColor: Colors.red,
            inactiveTrackColor: Colors.red.withOpacity(0.3),
          ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Employee {
  final String id;
  final String name;
  final String email;
  final String department;
  final String role;
  final String status;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.department,
    required this.role,
    required this.status,
  });
}
