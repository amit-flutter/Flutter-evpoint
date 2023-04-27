import 'package:evpoint/utils/imports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConst.kSplash,
      getPages: RouteConst().routePages,
      theme: kLightTheme,
      darkTheme: kDarkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
