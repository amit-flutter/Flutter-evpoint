import 'package:evpoint/utils/imports.dart';

class GoToDirection extends StatefulWidget {
  const GoToDirection({Key? key}) : super(key: key);

  @override
  State<GoToDirection> createState() => _GoToDirectionState();
}

class _GoToDirectionState extends State<GoToDirection> {
  late double height, width;
  int amountTxt = 390;
  String orderNo = "4578178";
  String restaurantName = "FoodiePie Restaurants";
  String addressTxt = "B-2024, Silver Corner, Ahmedabad";
  late GoogleMapController mapController;

  double _originLatitude = 23.0284, _originLongitude = 72.5068;

  double _destLatitude = 23.1013, _destLongitude = 72.5407;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [
    LatLng(23.0284, 72.5068),
    LatLng(23.0504, 72.4991),
    LatLng(23.1013, 72.5407),
  ];
  PolylinePoints polylinePoints = PolylinePoints();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  String googleAPiKey = LocationController.instance.googleMapApiKey;

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      visible: true,
      color: kPrimaryColor,
      points: polylineCoordinates,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
      markerId: markerId,
      icon: descriptor,
      position: position,
    );
    markers[markerId] = marker;
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey, PointLatLng(_originLatitude, _originLongitude), PointLatLng(_destLatitude, _destLongitude),
        travelMode: TravelMode.driving,
        wayPoints: [
          PolylineWayPoint(
            location: "Sabo, Yaba Lagos Nigeria",
          ),
        ]);

    print(result.points.toString());
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addMarker(
      LatLng(_originLatitude, _originLongitude),
      "origin",
      BitmapDescriptor.defaultMarker,
    );

    _addMarker(
      LatLng(_destLatitude, _destLongitude),
      "destination",
      BitmapDescriptor.defaultMarker,
    );
    _getPolyline();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(_originLatitude, _originLongitude),
                zoom: 12,
              ),
              myLocationEnabled: true,
              tiltGesturesEnabled: true,
              compassEnabled: true,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              onMapCreated: _onMapCreated,
              markers: Set<Marker>.of(markers.values),
              polylines: Set<Polyline>.of(polylines.values),
            ),
          ],
        ),
      ),
    );
  }
}
