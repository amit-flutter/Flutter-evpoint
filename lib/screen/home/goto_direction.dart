import 'package:evpoint/utils/imports.dart';

class GoToDirection extends StatefulWidget {
  const GoToDirection({Key? key}) : super(key: key);

  @override
  State<GoToDirection> createState() => _GoToDirectionState();
}

class _GoToDirectionState extends State<GoToDirection> {
  final LatLng _sourceLocation = const LatLng(37.33500926, -122.03272188);
  final LatLng _destinationLocation = const LatLng(37.33429383, -122.06600055);

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        LocationController.instance.googleMapApiKey,
        PointLatLng(_sourceLocation.latitude, _sourceLocation.longitude),
        PointLatLng(_destinationLocation.latitude, _destinationLocation.longitude));

    Logger.logPrint(title: "Getting PolyPoints", body: result.points.length.toString());
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
              LocationController.instance.position.value!.latitude,
              LocationController.instance.position.value!.longitude,
            ),
            zoom: 12,
          ),
          markers: {
            Marker(
              markerId: const MarkerId("source"),
              position: _sourceLocation,
              icon: AppCommonController.instance.markerIcon.value!,
            ),
            Marker(
              markerId: const MarkerId("destination"),
              position: _destinationLocation,
            ),
            Marker(
              markerId: const MarkerId("current"),
              position: LatLng(
                LocationController.instance.position.value!.latitude,
                LocationController.instance.position.value!.longitude,
              ),
            ),
          },
          polylines: {
            Polyline(
                polylineId: const PolylineId('route'), points: polylineCoordinates, color: kPrimaryColor, width: 20),
          },
          onMapCreated: (mapContrl) => LocationController.instance.mapController.complete(mapContrl),
        );
      }),
    );
  }
}
