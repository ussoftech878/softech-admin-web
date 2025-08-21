import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softech_admin/utils/images.dart';
import 'package:softech_admin/utils/theme.dart';
import 'package:softech_admin/widgets/booking_header.dart';
import 'package:softech_admin/widgets/booking_tile.dart';

class Emplloyeesscreen extends StatelessWidget {
  const Emplloyeesscreen({super.key});

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
              'Employees',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30.w),
                height: double.infinity,

                child: Column(
                  children: [
                    const BookingHeader(
                      text1: 'Booking ID',
                      text2: 'Car',
                      text3: 'Plate No',
                      text4: 'Toll Stations Crossed',
                      text5: 'Discount Validity',
                      text6: 'Start Date',
                      text7: 'Next Payments Date',
                      text8: '  KM Driven',
                      text9: 'Avilable KM',
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          final bool isEvenRow = index % 2 == 0;
                          return InkWell(
                            hoverColor: Colors.transparent,
                            onTap: () async {
                              // await Provider.of<BookingViewModel>(
                              //         context,
                              //         listen: false)
                              //     .BookingDetail(
                              //         bookingID:
                              //             booking.bookingId!.toInt())
                              //     .then((value) {
                              //   if (value) {
                              //     context.go(
                              //         '/booking/details/${booking.bookingId}');
                              //     //   context, bookingDetailsRoute);
                              //   } else {
                              //     EasyLoading.showError(
                              //         "Something went wrong");
                              //   }
                              // });
                            },
                            child: BookingTile(
                              color: isEvenRow
                                  ? AppColors.white
                                  : AppColors.teal,
                              icon: Icon(
                                Icons.more_vert,
                                size: 24.w,
                                color: AppColors.black,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.center,
            //   child: Consumer<BookingViewModel>(
            //     builder: (context, bookingViewModel, child) {
            //       final totalPages = bookingViewModel.getTotalPages(
            //         bookingViewModel.getMyBookingResponse.totalRecords ?? 0,
            //       );
            //       return totalPages > 1
            //           ? NumberPaginator(
            //               numberPages: totalPages,
            //               onPageChange: (index) {
            //                 bookingViewModel.goToPage(index + 1);
            //               },
            //               initialPage: bookingViewModel.page - 1,
            //             )
            //           : SizedBox.shrink();
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
