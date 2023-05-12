import 'package:evpoint/utils/imports.dart';

class StationMapView extends StatefulWidget {
  const StationMapView({super.key});

  @override
  State<StationMapView> createState() => _StationMapViewState();
}

class _StationMapViewState extends State<StationMapView> {
  bool isInfoOpen = false;
  final Completer<GoogleMapController> _mapController = Completer();
  static const CameraPosition _center = CameraPosition(target: LatLng(23.0602, 72.4902), zoom: 14);

  final List _marker = [
    ['1', const LatLng(23.0504, 72.4991), const InfoWindow(title: '1')],
    ['2', const LatLng(23.0602, 72.4991), const InfoWindow(title: '2')],
    ['3', const LatLng(23.0704, 72.4991), const InfoWindow(title: '3')],
    ['4', const LatLng(23.0804, 72.4991), const InfoWindow(title: '4')],
    ['5', const LatLng(23.0904, 72.4991), const InfoWindow(title: '5')],
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Obx(() {
            return GoogleMap(
              markers: {
                for (List i in _marker)
                  Marker(
                    markerId: MarkerId(i[0]),
                    position: i[1],
                    icon: AppCommonController.instance.markerIcon.value!,
                    onTap: () => setState(() => isInfoOpen = !isInfoOpen),
                  ),
              },
              onMapCreated: (GoogleMapController controller) {
                _mapController.complete(controller);
              },
              mapType: MapType.terrain,
              initialCameraPosition: _center,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
            );
          }),
          isInfoOpen ? const LocationInfoCard() : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class LocationInfoCard extends StatelessWidget {
  const LocationInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Name,Address, GotoLocation Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: "99 PRospect Park W",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    WidgetConst.kHeightSpacer(heightMultiplier: 0.5),
                    DefaultText(
                      text: "Brooklyn, 99 Projespect Park W",
                      style: Theme.of(context).textTheme.labelMedium!,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.only(right: 5),
                    backgroundColor: kPrimaryColor),
                child: const RotationTransition(
                    turns: AlwaysStoppedAnimation(330 / 360),
                    alignment: Alignment.topCenter,
                    child: Icon(Icons.send, size: 20)),
              )
            ],
          ),
          WidgetConst.kHeightSpacer(),

          //Starts
          Row(
            children: [
              DefaultText(
                text: "4.3",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                maxLines: 2,
              ),
              WidgetConst.kWidthSpacer(),
              for (int i = 0; i < 5; i++) const Icon(Icons.star, color: Colors.orange, size: 18),
              WidgetConst.kWidthSpacer(),
              DefaultText(
                text: "(107 reviews)",
                style: Theme.of(context).textTheme.labelMedium!,
                textAlign: TextAlign.start,
                maxLines: 2,
              ),
            ],
          ),
          WidgetConst.kHeightSpacer(),

          //Status and Distance
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: kPrimaryColor),
                child: Text(
                  "in Use",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(color: kScaffoldBackgroundColor),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                ),
              ),
              WidgetConst.kWidthSpacer(),
              const Icon(Icons.location_on, size: 15),
              WidgetConst.kWidthSpacer(widthMultiplier: 0.5),
              DefaultText(
                text: "1.9 km",
                style: Theme.of(context).textTheme.labelMedium!,
                textAlign: TextAlign.start,
                maxLines: 2,
              ),
              WidgetConst.kWidthSpacer(),
              const Icon(Icons.cases_rounded, size: 15),
              WidgetConst.kWidthSpacer(widthMultiplier: 0.5),
              DefaultText(
                text: "7 mins",
                style: Theme.of(context).textTheme.labelMedium!,
                textAlign: TextAlign.start,
                maxLines: 2,
              ),
            ],
          ),

          //Chargers Type
          const Divider(),
          Row(
            children: [
              const Icon(Icons.group_work_outlined, size: 20),
              const Icon(Icons.outlet_outlined, size: 20),
              const Icon(Icons.album_outlined, size: 20),
              const Spacer(),
              DefaultText(
                text: "3 chargers",
                style:
                    Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
                textAlign: TextAlign.start,
              ),
              WidgetConst.kWidthSpacer(),
              const Icon(Icons.keyboard_arrow_right_rounded)
            ],
          ),
          const Divider(),

          //Button
          Row(
            children: [
              Expanded(
                child: CustomOutlineButton(
                  onPressed: () {
                    Get.toNamed("${RouteConst.kHome}/${RouteConst.kViewDetailsInfo}");
                  },
                  child: DefaultText(
                    text: "View",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              WidgetConst.kWidthSpacer(),
              Expanded(
                child: CustomOutlineButton(
                  backgroundColor: kPrimaryColor,
                  onPressed: () {},
                  child: DefaultText(
                    text: "Book",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.bold, color: kScaffoldBackgroundColor),
                    textAlign: TextAlign.start,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
