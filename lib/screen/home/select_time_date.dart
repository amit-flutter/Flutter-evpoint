import 'package:evpoint/utils/imports.dart';

class SelectTimeAndDate extends StatelessWidget {
  const SelectTimeAndDate({Key? key}) : super(key: key);

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
            title:
                DefaultText(text: "Booking", style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 20)),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomDatePicker(title: "Select Date"),
                    const CustomTimePicker(title: "Select Time"),
                    WidgetConst.kHeightSpacer(heightMultiplier: 2),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: kSecondaryColor),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  ],
                ),
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
                onPressed: () => Get.toNamed(RouteConst.kSelectPaymentMethod),
                child: DefaultText(
                  text: "Continue",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.bold, color: kScaffoldBackgroundColor),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
