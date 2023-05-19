import 'package:evpoint/utils/imports.dart';

class ReviewSummary extends StatelessWidget {
  const ReviewSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppBar(
            centerTitle: false,
            titleSpacing: 0,
            leadingWidth: 70,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back, size: 34),
            ),
            title: DefaultText(
                text: "Review Summary", style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 20)),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getTitle(context: context, title: "Vehicle"),
                  const SelectVehicleCard(
                    carImage: Icon(Icons.electric_bike_sharp, size: 50),
                    carName: "Re-volt",
                    carDescription: "Re-360 Boss",
                    isFinalCard: true,
                  ),
                  getTitle(context: context, title: "Charging Station"),
                  SelectVehicleCard(
                    carImage: Image.asset(StringsConst.kImgAppIcon, height: 50, width: 50),
                    carName: "Warlgreens - Brooklyn, NY",
                    carDescription: "Brooklyn, 567 Prospect Avenue",
                    isFinalCard: true,
                  ),
                  getTitle(context: context, title: "Charger"),
                  SelectChargerCard(
                    plugName: "Tesla (Plug)",
                    maxPower: "100 KW",
                    isFinalCard: true,
                    plugType: Icon(
                      Icons.group_work_outlined,
                      size: 30,
                      color: Theme.of(context).textTheme.titleMedium!.color,
                    ),
                  ),
                  GetGrayDetailsContainer(
                    itemCount: StringsConst.kReviewSummaryDate.length,
                    item: StringsConst.kReviewSummaryDate,
                  ),
                  GetGrayDetailsContainer(
                    itemCount: StringsConst.kReviewSummaryPayment.length,
                    item: StringsConst.kReviewSummaryPayment,
                  ),
                  getTitle(context: context, title: "Selected Payment Method"),
                  const SelectPaymentCard(
                    paymentImage: Icon(Icons.payments_outlined, size: 50),
                    paymentMethodName: 'Cash',
                    paymentAmount: '\$ 100',
                    isFinalCard: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: CustomOutlineButton(
                      onPressed: () {},
                      borderRadius: 10,
                      backgroundColor: kSecondaryColor,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.info),
                            WidgetConst.kWidthSpacer(),
                            Expanded(
                              child: DefaultText(
                                text: "Your e-wallet will not be charged as long as you have't charged it at the EV "
                                    "charging station",
                                maxLines: 3,
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: kSecondaryTextColor, fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              height: 50,
              width: Get.width - 40,
              child: CustomOutlineButton(
                backgroundColor: kPrimaryColor,
                onPressed: () {
                  showCustomDialog(
                    context: context,
                    customDialogUI: CustomDialogUI(
                      logoImage: Theme.of(context).brightness == Brightness.light
                          ? StringsConst.kDoneBubble
                          : StringsConst.kDoneBubbleDark,
                      title: "Booking Successful!",
                      subTitle: "You can view booking details on the My Booking menu",
                      lastImage: "",
                      bottomWidget: SizedBox(
                        width: Get.width,
                        height: 50,
                        child: CustomOutlineButton(
                          backgroundColor: kPrimaryColor,
                          onPressed: () => Get.offNamedUntil(RouteConst.kPreHome, (route) => false),
                          child: DefaultText(
                            text: "OK",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(fontWeight: FontWeight.bold, color: kScaffoldBackgroundColor),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: DefaultText(
                  text: "Continue",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.bold, color: kScaffoldBackgroundColor),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Padding getTitle({required title, required context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: DefaultText(
        text: title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
      ),
    );
  }
}

class GetGrayDetailsContainer extends StatelessWidget {
  const GetGrayDetailsContainer({
    super.key,
    required this.itemCount,
    required this.item,
  });

  final int itemCount;
  final List item;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kFifthTextColor,
          border: Border.all(width: 0.4, color: kSecondaryTextColor),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultText(
                  text: item[index][1],
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kSecondaryTextColor),
                ),
                DefaultText(
                  text: item[index][2],
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            );
          },
          separatorBuilder: (context, index) =>
              item[index][0] == true ? const Divider(height: 25, thickness: 1) : const SizedBox(height: 20),
        ));
  }
}
