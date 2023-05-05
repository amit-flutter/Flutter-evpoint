import 'package:evpoint/utils/imports.dart';

class RouteConst {
  /// Routes name to directly navigate the route by its name

  static const String kSplash = "/splash";
  static const String kWelcome = "/welcome";
  static const String kLogin = "/login";
  static const String kSignUp = "/signUp";
  static const String kOtpVerification = "/otpVerification";
  static const String kCompleteYourProfile = "/completeYourProfile";
  static const String kAddVehicle = "/addVehicle";

  static const String kSignIn = "/signIn";
  static const String kPreHome = "/preHome";
  static const String kHome = "/home";

  /// Add this list variable into your GetMaterialApp as the value of getPages parameter.
  /// You can get the reference to the above GetMaterialApp code.
  final List<GetPage> _getPages = [
    GetPage(name: kSplash, page: () => const SplashScreen()),
    GetPage(name: kWelcome, page: () => const WelcomeScreen()),
    GetPage(name: kLogin, page: () => const LoginScreen()),
    GetPage(name: kSignUp, page: () => const SignUpScreen()),
    GetPage(name: kOtpVerification, page: () => const OTPVerificationScreen()),
    GetPage(name: kCompleteYourProfile, page: () => const CompleteYourProfileScreen()),
    GetPage(name: kAddVehicle, page: () => const AddVehicleScreen()),
    GetPage(name: kSignIn, page: () => const SignInScreen()),
    GetPage(name: kPreHome, page: () => const PreHomeScreen()),
    GetPage(name: kHome, page: () => const HomeScreen()),
  ];

  get routePages => _getPages;
}
