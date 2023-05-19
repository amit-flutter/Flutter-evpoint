import 'package:evpoint/utils/imports.dart';

class LocationController extends GetxController {
  static LocationController instance = Get.find();
  String? _currentAddress;
  final position = Rxn<Position>();

  final String _googleMapApiKey = 'AIzaSyCtSDgXXNFVywGtf8ZNucA1G1cQP3ABxr4';
  String get googleMapApiKey => _googleMapApiKey;

  String get currentAddress => _currentAddress ?? "";
  late GoogleMapController googleMapController;
  final Completer<GoogleMapController> mapController = Completer();

  Future<void> getLocation() async {
    try {
      //Get User Permission First
      if (await PermissionHandler.handleLocationPermission()) {
        //Get User Current position
        await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position pos) {
          position.value = pos;
          // Logger.logPrint(title: "Location", body: position.toString());
          // getPLaceMarkFromCoordinates(lat: position.value!.latitude, long: position.value!.longitude);
        }).catchError((e) {
          debugPrint(e);
        });

        googleMapController = await mapController.future;

        Geolocator.getPositionStream().listen((event) {
          position.value = event;
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 13.0,
              target: LatLng(
                LocationController.instance.position.value!.latitude,
                LocationController.instance.position.value!.longitude,
              ),
            ),
          ));
        });
      } else {
        Get.snackbar("Caution !", "To see nearest ev point you need to give location permission.");
      }
    } catch (e) {
      Logger.logPrint(title: "Error While Get Location", body: '$e');
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
