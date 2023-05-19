// ignore_for_file: unnecessary_cast

import 'package:evpoint/utils/imports.dart';

class AppCommonController extends GetxController {
  static AppCommonController instance = Get.find();
  Rx<PackageInfo> packageInfo = PackageInfo(appName: "", packageName: "", version: "", buildNumber: "").obs;
  Rx<BitmapDescriptor?> markerIcon = (null as BitmapDescriptor?).obs;

  @override
  Future<void> onInit() async {
    packageInfo.value = await PackageInfo.fromPlatform();
    markerIcon.value = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(300, 300), devicePixelRatio: 0.1),
      "assets/images/evpoint.png",
    );
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
