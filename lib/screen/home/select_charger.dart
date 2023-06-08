import 'package:evpoint/utils/imports.dart';

class SelectCharger extends StatelessWidget {
  const SelectCharger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          AppBar(
            centerTitle: false,
            titleSpacing: 0,
            leadingWidth: 70,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back, size: 34),
            ),
            title: DefaultText(
                text: "Select Charger", style: Get.theme.textTheme.headlineSmall!.copyWith(fontSize: 20)),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SelectChargerCard(
                    plugName: "Tesla (Personal User Charger",
                    maxPower: "100 kW",
                    plugType: Icon(
                      Icons.group_work_outlined,
                      size: 30,
                      color: Get.theme.textTheme.titleMedium!.color,
                    ),
                  );
                }),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 50,
            width: Get.width - 40,
            child: CustomOutlineButton(
              backgroundColor: kPrimaryColor,
              onPressed: () => Get.toNamed(RouteConst.kSelectTimeAndDate),
              child: DefaultText(
                text: "Continue",
                style: Get.theme
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.bold, color: kScaffoldBackgroundColor),
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class SelectChargerCard extends StatelessWidget {
  const SelectChargerCard({
    super.key,
    required this.plugName,
    required this.maxPower,
    required this.plugType,
    this.isFinalCard = false,
  });

  final String plugName;
  final String maxPower;
  final Widget plugType;
  final bool isFinalCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Get.theme.brightness == Brightness.light ? kFifthTextColor : kDarkSecondaryColor,
        border: Border.all(width: 0.4, color: kSecondaryTextColor),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DefaultText(
                          text: plugName,
                          style: Get.theme
                              .textTheme
                              .titleMedium!
                              .copyWith(color: kSecondaryTextColor, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      DefaultText(
                        text: "• AC/DC",
                        style: Get.theme
                            .textTheme
                            .titleMedium!
                            .copyWith(color: kSecondaryTextColor, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  WidgetConst.kHeightSpacer(),
                  plugType
                ],
              ),
            ),
            const VerticalDivider(thickness: 1.2, width: 30),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: "Max. Power",
                    style: Get.theme
                        .textTheme
                        .titleMedium!
                        .copyWith(color: kSecondaryTextColor, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  DefaultText(
                    text: maxPower,
                    style: Get.theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            if (!isFinalCard) Radio(value: 2, groupValue: "2", visualDensity: VisualDensity.compact, onChanged: (v) {})
          ],
        ),
      ),
    );
  }
}
