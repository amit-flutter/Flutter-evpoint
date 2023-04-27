import 'package:evpoint/utils/imports.dart';

class RouteConst {
  /// Routes name to directly navigate the route by its name

  static const String kSplash = "/splash";
  static const String kLogin = "/login";
  static const String kHome = "/home";

  /// Add this list variable into your GetMaterialApp as the value of getPages parameter.
  /// You can get the reference to the above GetMaterialApp code.
  final List<GetPage> _getPages = [
    GetPage(name: kSplash, page: () => const SplashScreen()),
    GetPage(name: kLogin, page: () => const LoginScreen()),
    GetPage(name: kHome, page: () => const HomeScreen()),
  ];

  get routePages => _getPages;
}
