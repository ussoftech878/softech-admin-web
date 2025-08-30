import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:softech_admin/screens/AttendanceScreen.dart';
import 'package:softech_admin/screens/EmplloyeesScreen.dart';
import 'package:softech_admin/screens/HomeScreen.dart';
import 'package:softech_admin/screens/NotFoundScreen.dart';

// User Dashboard Routes
const String signUpRoute = '/signUp';
const String resetPasswordRoute = '/resetPassword';
const String otpRoute = '/otp';
const String forgotPasswordRoute = '/forgotPassword';
const String loginRoute = '/login';
const String profileRoute = '/profile';
const String bookingRoute = '/booking';
const String bookingDetailsRoute = '/booking/details';
const String cardManagementRoute = '/cardmanagement';
const String transactionRoute = '/transaction';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _usershellNavigator =
    GlobalKey<NavigatorState>();

CustomTransitionPage buildPageWithoutTransition({
  required Widget child,
  required String location,
}) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        child,
    key: ValueKey(location),
  );
}

const String homeRoute = '/';
const String EmployeeRoute = '/employee';
const String AttendanceRoute = '/attendance';
const String privacyPolicyRoute = '/privacy-policy';
const String termsAndConditionsRoute = '/terms-and-conditions';
const String viewAllRoute = '/cars';
const String carDetailsRoute2 = '/car-details-2';
const String transactionDetailRoute = '/transactionDetail';

// Router configuration
final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: homeRoute,
  errorBuilder: (context, state) => const NotFoundScreen(),
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => Homescreen(child: child),
      routes: [
        GoRoute(
          path: homeRoute,
          builder: (context, state) => Emplloyeesscreen(), // default child
        ),
        GoRoute(
          path: EmployeeRoute,
          builder: (context, state) => Emplloyeesscreen(),
        ),
        GoRoute(
          path: AttendanceRoute,
          builder: (context, state) => AttendancePage(),
        ),
      ],
    ),
  ],
);
