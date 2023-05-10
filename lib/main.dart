import 'package:evpoint/utils/imports.dart';

Future<void> main() async {
  //Firebase initialization.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(FirebaseAuthController()));
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
