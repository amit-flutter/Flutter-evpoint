import 'package:evpoint/utils/imports.dart';

class NetworkConnectivityController extends GetxController {
  static NetworkConnectivityController instance = Get.find();

  ConnectivityResult? connectivityResult;
  StreamSubscription<ConnectivityResult>? networkConnection;

  @override
  Future<void> onInit() async {
    connectivityResult = await Connectivity().checkConnectivity();
    networkConnection = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      Logger.logPrint(title: result.toString());
    });
    super.onInit();
  }

  @override
  void dispose() {
    networkConnection!.cancel();
    super.dispose();
  }
}
