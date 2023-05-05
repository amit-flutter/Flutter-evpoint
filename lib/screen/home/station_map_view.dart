import 'package:evpoint/utils/imports.dart';

class StationMapView extends StatefulWidget {
  const StationMapView({super.key});

  @override
  State<StationMapView> createState() => _StationMapViewState();
}

class _StationMapViewState extends State<StationMapView> {
  final Completer<GoogleMapController> _mapController = Completer();

  static const CameraPosition _center = CameraPosition(target: LatLng(23.0225, 72.5714), zoom: 14);

  final List<Marker> _marker = [];

  final List<Marker> _branch = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(23.0504, 72.4991),
      infoWindow: InfoWindow(title: "Testing"),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(23.0802, 72.4952),
      infoWindow: InfoWindow(title: "Testing 2", snippet: 'testing 2'),
    ),
  ];

  @override
  void initState() {
    _marker.addAll(_branch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
          _mapController.complete(controller);
        },
        mapType: MapType.hybrid,
        initialCameraPosition: _center,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
      ),
    );
  }
}
