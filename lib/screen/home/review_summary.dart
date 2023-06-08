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
                text: Get.arguments == "booking" ? "Booking Details" : "Review Summary",
                style: Get.theme.textTheme.headlineSmall!.copyWith(fontSize: 20)),
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
                      color: Get.theme.textTheme.titleMedium!.color,
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
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: kSecondaryColor),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                            style: Get.theme
                                .textTheme
                                .titleMedium!
                                .copyWith(color: kSecondaryTextColor, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
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
                onPressed: () async {
                  if (Get.arguments == "booking") {
                    //Open Bottom Sheet
                    await showBottomSheet(context);
                  } else {
                    showCancelDialog(
                      context,
                      "Booking Successful!",
                      "You can view booking details on the My Booking menu",
                      () => Get.offNamedUntil(RouteConst.kPreHome, (route) => false, arguments: 1),
                    );
                  }
                },
                child: DefaultText(
                  text: Get.arguments == "booking" ? "Cancel Booking" : "Continue",
                  style: Get.theme
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

  Future<dynamic> showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (builder) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultText(
                    text: "Cancel Booking",
                    style: Get.theme.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                  ),
                  const Divider(height: 40),
                  DefaultText(
                    text: "Are you sure you want to cancel the booking?",
                    maxLines: 2,
                    style: Get.theme.textTheme.titleLarge!,
                  ),
                  WidgetConst.kHeightSpacer(),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: CustomElevatedButton(
                            onPressed: () => Get.back(),
                            text: "No,Don't Cancel",
                            elevation: 0,
                            style: Get.theme
                                .textTheme
                                .labelLarge!
                                .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      WidgetConst.kWidthSpacer(),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: CustomOutlineButton(
                            backgroundColor: kPrimaryColor,
                            onPressed: () async {
                              Get.back();
                              await showCancelDialog(
                                context,
                                "Successful Cancellation",
                                "Your booking has been successfully cancelled.",
                                () => Get.offNamedUntil(RouteConst.kPreHome, (route) => false, arguments: 2),
                              );
                            },
                            child: DefaultText(
                              text: "Yes, Cancel",
                              style: Get.theme
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
                ],
              ),
            ),
          );
        });
  }

  Future<void> showCancelDialog(BuildContext context, String title, String subtitle, Function() onTap) async {
    return await showCustomDialog(
      context: context,
      customDialogUI: CustomDialogUI(
        logoImage:
            Get.theme.brightness == Brightness.light ? StringsConst.kDoneBubble : StringsConst.kDoneBubbleDark,
        title: title,
        subTitle: subtitle,
        lastImage: "",
        bottomWidget: SizedBox(
          width: Get.width,
          height: 50,
          child: CustomOutlineButton(
            backgroundColor: kPrimaryColor,
            onPressed: onTap,
            child: DefaultText(
              text: "OK",
              style: Get.theme
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.bold, color: kScaffoldBackgroundColor),
            ),
          ),
        ),
      ),
    );
  }

  Padding getTitle({required title, required context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: DefaultText(
        text: title,
        style: Get.theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
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
          color: Get.theme.brightness == Brightness.light ? kFifthTextColor : kDarkSecondaryColor,
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
                  style: Get.theme.textTheme.titleMedium!.copyWith(color: kSecondaryTextColor),
                ),
                DefaultText(
                  text: item[index][2],
                  style: Get.theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            );
          },
          separatorBuilder: (context, index) =>
              item[index][0] == true ? const Divider(height: 25, thickness: 1) : const SizedBox(height: 20),
        ));
  }
}
