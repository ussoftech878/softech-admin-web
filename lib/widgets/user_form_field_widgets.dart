import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:softech_admin/utils/theme.dart';
import 'package:softech_admin/view_model/Auth_viewmodel.dart';
import 'package:softech_admin/widgets/custom_font_style.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewmodel>(builder: (_, authviewmodel, __) {
      return Column(
        children: [
          Container(
            height: 200.h,
            child: TextFormField(
              controller: authviewmodel.getemailController,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary), // Default border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary.withValues(alpha: 0.5)), // Normal state border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary, width: 2), // Focused state border
                  ),
                ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Visibility(
                visible: authviewmodel.getemailFieldError.isNotEmpty,
                child: red14w400(data: authviewmodel.getemailFieldError)),
          ),
        ],
      );
    });
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewmodel>(builder: (_, authviewmodel, __) {
      return Column(
        children: [
          Container(
            height: 200.h,
            child: TextFormField(
              obscureText: authviewmodel.getsecurePassword,
              controller: authviewmodel.getPasswordController,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary), // Default border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary.withValues(alpha: 0.5)), // Normal state border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary, width: 2), // Focused state border
                  ),
                  suffixIcon: InkWell(
                    child: Icon(Icons.visibility, color: AppColors.primary,),
                    onTap: () {
                      authviewmodel.setSecurePassword();
                    },
                  )
                ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Visibility(
                visible: authviewmodel.getpasswordFieldError.isNotEmpty,
                child: red14w400(data: authviewmodel.getpasswordFieldError)),
          ),
        ],
      );
    });
  }
}

class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewmodel>(builder: (_, authviewmodel, __) {
      return Column(
        children: [
          Container(
            height: 200.h,
            child: TextFormField(
              obscureText: authviewmodel.getsecureconfrimPassword,
              controller: authviewmodel.getConfirmPasswordController,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hoverColor: Colors.transparent,
                suffixIcon: InkWell(
                  child: Icon(Icons.visibility),
                  onTap: () {
                    authviewmodel.setConfrimSecurePassword();
                  },
                ),
                hintText: "Enter Password",
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Visibility(
                visible: authviewmodel.getConfirmPasswordFieldError.isNotEmpty,
                child: red14w400(
                    data: authviewmodel.getConfirmPasswordFieldError)),
          ),
        ],
      );
    });
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewmodel>(builder: (_, authviewmodel, __) {
      return Column(
        children: [
          Container(
            height: 200.h,
            child: TextFormField(
              controller: authviewmodel.getFullNameController,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hoverColor: Colors.transparent,
                hintText: "full name",
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Visibility(
                visible: authviewmodel.getnameFieldError.isNotEmpty,
                child: red14w400(data: authviewmodel.getnameFieldError)),
          ),
        ],
      );
    });
  }
}

// class PhoneTextField extends StatelessWidget {
//   const PhoneTextField({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AuthViewmodel>(builder: (_, authviewmodel, __) {
//       return Column(
//         children: [
//           Container(
//             height: 200.h,
//             child: TextFormField(
//               keyboardType: TextInputType.phone,
//               controller: authviewmodel.getPhoneNumberController,
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w400,
//               ),
//               decoration: InputDecoration(
//                 hoverColor: Colors.transparent,
//                 hintText: "+12 345 678 90",
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 5.h,
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Visibility(
//                 visible: authviewmodel.getphoneFieldError.isNotEmpty,
//                 child: red14w400(data: authviewmodel.getphoneFieldError)),
//           ),
//         ],
//       );
//     });
//   }
// }

// class CurrentPasswordTextField extends StatelessWidget {
//   const CurrentPasswordTextField({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AuthViewModel>(builder: (_, authviewmodel, __) {
//       return Column(
//         children: [
//           Container(
//             height: 200.h,
//             child: TextFormField(
//               obscureText: authviewmodel.getcurrentSecurePassword,
//               controller: authviewmodel.getCurrentPasswordController,
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w400,
//               ),
//               decoration: InputDecoration(
//                 hoverColor: Colors.transparent,
//                 suffixIcon: InkWell(
//                   child: SvgPicture.asset(fit: BoxFit.scaleDown, SvgAssets.eye),
//                   onTap: () {
//                     authviewmodel.setCurrentSecurePassword();
//                   },
//                 ),
//                 hintText: "Enter Password",
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 5.h,
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Visibility(
//                 visible: authviewmodel.getcurrrentPasswordFieldError.isNotEmpty,
//                 child: red14w400(
//                     data: authviewmodel.getcurrrentPasswordFieldError)),
//           ),
//         ],
//       );
//     });
//   }
// }

// class CouponCodeTextField extends StatelessWidget {
//   const CouponCodeTextField({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CarViewModel>(builder: (_, carviewmodel, __) {
//       return Column(
//         children: [
//           Container(
//             height: 200.h,
//             child: TextFormField(
//               enabled: carviewmodel.getcouponCode.isEmpty,
//               controller: carviewmodel.couponCodeController,
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w400,
//               ),
//               decoration: InputDecoration(
//                 hoverColor: Colors.transparent,
//                 hintText: "Enter Discount Code",
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 5.h,
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Visibility(
//                 visible: carviewmodel.couponCodeFieldError.isNotEmpty,
//                 child: red14w400(data: carviewmodel.couponCodeFieldError)),
//           ),
//         ],
//       );
//     });
//   }
// }
