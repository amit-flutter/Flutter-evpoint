import 'dart:async';

import 'package:evpoint/utils/imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void startTimer() {
    // Future.delayed(const Duration(seconds: 2), () {
    //   Get.offNamed(RouteConst.kWelcome);
    // });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(),
            Column(
              children: [
                Image.asset(StringsConst.kImgAppIcon, width: 150, height: 150),
                DefaultText(
                  text: StringsConst.kTextEvPoint,
                  style: Theme.of(context).textTheme.headlineSmall!,
                )
              ],
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
