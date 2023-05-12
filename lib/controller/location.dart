import 'package:evpoint/utils/imports.dart';

class LocationController extends GetxController {
  static LocationController instance = Get.find();
  String? _currentAddress;
  Position? _position;

  Position get position => _position!;
  String get currentAddress => _currentAddress ?? "";

  Future<void> getLocation() async {
    try {
      //Get User Permission First
      if (await PermissionHandler.handleLocationPermission()) {
        //Get User Current position
        await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) {
          _position = position;
          // Logger.logPrint(title: "Location", body: position.toString());
          getPLaceMarkFromCoordinates(lat: position.latitude, long: position.longitude);
        }).catchError((e) {
          debugPrint(e);
        });
      } else {
        Get.snackbar("Caution !", "To see nearest ev point you need to give location permission.");
      }
    } catch (e) {
      Logger.logPrint(title: "Error While Get Location", body: e.toString());
    }
  }

  getPLaceMarkFromCoordinates({required double lat, required double long}) async {
    try {
      await placemarkFromCoordinates(lat, long).then((List<Placemark> placemarks) {
        Placemark place = placemarks[0];
        _currentAddress = '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
        // Logger.logPrint(title: "Address", body: _currentAddress ?? "");
      }).catchError((e) {
        debugPrint(e);
      });
    } catch (e) {
      Logger.logPrint(title: "Error While Get Location", body: e.toString());
    }
  }
}
