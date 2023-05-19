import 'package:evpoint/utils/imports.dart';

class ViewDetailsInfo extends StatefulWidget {
  const ViewDetailsInfo({Key? key}) : super(key: key);

  @override
  State<ViewDetailsInfo> createState() => _ViewDetailsInfoState();
}

class _ViewDetailsInfoState extends State<ViewDetailsInfo> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                //Background Image and Back,save,send Button
                const AppBarAndBackgroundImage(),

                //Name,Address, GotoLocation Button
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(
                                text: "99 PRospect Park W",
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(height: 1.5),
                                textAlign: TextAlign.start,
                              ),
                              WidgetConst.kHeightSpacer(heightMultiplier: 0.5),
                              DefaultText(
                                text: "Brooklyn, 99 Projespect Park W",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.7),
                                textAlign: TextAlign.start,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ],
                      ),
                      WidgetConst.kHeightSpacer(),

                      //Starts
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          DefaultText(
                            text: "4.3",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(height: 1.7, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                            maxLines: 2,
                          ),
                          WidgetConst.kWidthSpacer(),
                          for (int i = 0; i < 5; i++) const Icon(Icons.star, color: Colors.orange, size: 22),
                          WidgetConst.kWidthSpacer(),
                          DefaultText(
                            text: "(107 reviews)",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.7),
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
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kScaffoldBackgroundColor),
                              textAlign: TextAlign.start,
                              maxLines: 2,
                            ),
                          ),
                          WidgetConst.kWidthSpacer(),
                          const Icon(Icons.location_on, size: 18),
                          WidgetConst.kWidthSpacer(widthMultiplier: 0.5),
                          DefaultText(
                            text: "1.9 km",
                            style: Theme.of(context).textTheme.titleMedium!,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                          ),
                          WidgetConst.kWidthSpacer(),
                          const Icon(Icons.cases_rounded, size: 18),
                          WidgetConst.kWidthSpacer(widthMultiplier: 0.5),
                          DefaultText(
                            text: "7 mins",
                            style: Theme.of(context).textTheme.titleMedium!,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      WidgetConst.kHeightSpacer(),

                      //GetDirection and Route Planner
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: CustomOutlineButton(
                                  backgroundColor: kPrimaryColor,
                                  onPressed: () => Get.toNamed(RouteConst.kGoToDirection),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const RotationTransition(
                                        turns: AlwaysStoppedAnimation(330 / 360),
                                        alignment: Alignment.topCenter,
                                        child: Icon(Icons.send, size: 20, color: Colors.white),
                                      ),
                                      WidgetConst.kWidthSpacer(),
                                      DefaultText(
                                        text: "Get Direction",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(fontWeight: FontWeight.bold, color: kScaffoldBackgroundColor),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            WidgetConst.kWidthSpacer(),
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: CustomOutlineButton(
                                  onPressed: () {
                                    // Get.toNamed("${RouteConst.kHome}/${RouteConst.kViewDetailsInfo}");
                                  },
                                  child: DefaultText(
                                    text: "Route Planner",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(),

                      //More info
                      WidgetConst.kHeightSpacer(),
                      TabBar(
                        labelColor: kPrimaryColor,
                        controller: _tabController,
                        unselectedLabelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: const [
                          Tab(text: "Info"),
                          Tab(text: "Charges"),
                          Tab(text: "Check-Ins"),
                          Tab(text: "More")
                        ],
                      ),
                      SizedBox(
                        height: Get.height / 1.3,
                        child: TabBarView(
                          controller: _tabController,
                          children: const [
                            InfoSection(),
                            Text('Person'),
                            Text('Person'),
                            Text('Person'),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20, top: 10),
            child: Row(
              children: [
                SizedBox(
                  height: 50,
                  child: CustomOutlineButton(
                    onPressed: () {
                      Get.to(() => const QRCodeScanner());
                    },
                    backgroundColor: kSecondaryColor,
                    child: const Icon(Icons.qr_code_scanner_outlined),
                  ),
                ),
                WidgetConst.kWidthSpacer(),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: CustomOutlineButton(
                      backgroundColor: kPrimaryColor,
                      onPressed: () => Get.toNamed(RouteConst.kSelectVehicle),
                      child: DefaultText(
                        text: "Book",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontWeight: FontWeight.bold, color: kScaffoldBackgroundColor),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarAndBackgroundImage extends StatelessWidget {
  const AppBarAndBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/evStation.png', height: Get.height / 3, fit: BoxFit.cover, width: Get.width),
        SafeArea(
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(5),
                  backgroundColor: Colors.white.withOpacity(0.5),
                ),
                child: const Icon(Icons.keyboard_arrow_left_rounded, size: 40),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.white.withOpacity(0.5),
                ),
                child: const Icon(Icons.bookmark_outline_rounded, size: 30),
              ),
              ElevatedButton(
                onPressed: () {
                  Share.share(
                      'Checkout full EvPoint Design https://www.figma.com/file/LjFO2vpGm2yEHjpYCESOkh/EVPoint---EV-Charging-Station-Finder-App-UI-Kit-(Preview)?type=design',
                      subject: 'Powered By CodzGarage https://www.codzgarage.com');
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.white.withOpacity(0.5),
                ),
                child: const Icon(Icons.share, size: 30),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InfoSection extends StatelessWidget {
  const InfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetConst.kHeightSpacer(),
          DefaultText(text: "About", style: Theme.of(context).textTheme.headlineSmall!),
          WidgetConst.kHeightSpacer(),
          ReadMoreText(
            "In this post, we are going to see how to build a simple TabBar in Flutter. We will start with a very basic "
            "view to add a tab bar first within an AppBar. We will also see how to add icons and other "
            "customizations to a TabBar in a flutter.",
            trimMode: TrimMode.line,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kSecondaryTextColor),
          ),
          WidgetConst.kHeightSpacer(heightMultiplier: 2),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kFifthTextColor,
              border: Border.all(width: 0.4, color: kSecondaryTextColor),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultText(
                      text: "Parking",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kSecondaryTextColor),
                    ),
                    DefaultText(
                      text: "Pay",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Divider(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultText(
                      text: "Cost",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kSecondaryTextColor),
                    ),
                    DefaultText(
                      text: "Payment is required",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
          WidgetConst.kHeightSpacer(heightMultiplier: 2),
          for (int _ in [1, 2, 3])
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kFifthTextColor,
                border: Border.all(width: 0.4, color: kSecondaryTextColor),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: "Amenities",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const Divider(height: 30),
                  const Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            IconAndText(icon: Icons.table_restaurant, text: "Restrooms"),
                            IconAndText(icon: Icons.restaurant, text: "Restaurant"),
                            IconAndText(icon: Icons.tv, text: "Entertainment"),
                            IconAndText(icon: Icons.shopping_bag_outlined, text: "Shops"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            IconAndText(icon: Icons.roofing_sharp, text: "Lounge area"),
                            IconAndText(icon: Icons.wifi, text: "Wi-fi"),
                            IconAndText(icon: Icons.air_outlined, text: "Air for Tyres"),
                            IconAndText(icon: Icons.security_rounded, text: "Maintenance"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          WidgetConst.kHeightSpacer(),
          DefaultText(text: "Location", style: Theme.of(context).textTheme.headlineSmall!),
          WidgetConst.kHeightSpacer(),
          Row(
            children: [
              const Icon(Icons.room),
              DefaultText(
                text: "Brooklyn, 567 Prospect Avenue",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kSecondaryTextColor),
              ),
            ],
          ),
          WidgetConst.kHeightSpacer(heightMultiplier: 2),
          const OneLocationMapView(),
          WidgetConst.kHeightSpacer(heightMultiplier: 10),
        ],
      ),
    );
  }
}

class IconAndText extends StatelessWidget {
  const IconAndText({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(icon),
        WidgetConst.kWidthSpacer(),
        Expanded(
          child: DefaultText(
            text: text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, height: 2),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}

class OneLocationMapView extends StatefulWidget {
  const OneLocationMapView({Key? key}) : super(key: key);

  @override
  State<OneLocationMapView> createState() => _OneLocationMapViewState();
}

class _OneLocationMapViewState extends State<OneLocationMapView> {
  final Completer<GoogleMapController> _mapController = Completer();
  final CameraPosition _center = const CameraPosition(target: LatLng(23.0602, 72.4902), zoom: 14);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: Get.width,
      child: Obx(() {
        return GoogleMap(
          markers: {
            Marker(
              markerId: const MarkerId("1"),
              position: const LatLng(23.0504, 72.4991),
              icon: AppCommonController.instance.markerIcon.value!,
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
    );
  }
}
