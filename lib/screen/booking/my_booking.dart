import 'package:evpoint/utils/imports.dart';
import 'package:flutter/cupertino.dart';

enum BookingType { upcoming, complete, canceled }

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: CustomAppBar(
            title: "My Booking",
            bottom: TabBar(
              labelColor: kPrimaryColor,
              unselectedLabelColor:
                  Get.theme.brightness == Brightness.light ? kPrimaryTextColor : kDarkPrimaryTextColor,
              indicatorSize: TabBarIndicatorSize.tab,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              tabs: const [Tab(text: "Upcoming"), Tab(text: "Complete"), Tab(text: "Canceled")],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: TabBarView(
            children: [
              ListView.builder(
                  itemCount: 2, itemBuilder: (context, index) => const BookingCard(bookingType: BookingType.upcoming)),
              ListView.builder(
                  itemCount: 2, itemBuilder: (context, index) => const BookingCard(bookingType: BookingType.complete)),
              ListView.builder(
                  itemCount: 2, itemBuilder: (context, index) => const BookingCard(bookingType: BookingType.canceled)),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  const BookingCard({Key? key, required this.bookingType}) : super(key: key);
  final BookingType bookingType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Get.theme.brightness == Brightness.light ? kFifthTextColor : kDarkSecondaryColor,
        border: Border.all(width: 0.4, color: kSecondaryTextColor),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        //Time and date
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(text: "Date 05, 2024", style: Get.theme.textTheme.titleMedium!),
                  DefaultText(
                      text: "Time 12:44 PM", style: Get.theme.textTheme.titleMedium!.copyWith(height: 2)),
                ],
              ),
            ),

            ///[Dynamic-Widget] it will take booking card type and change ui as per requirement.
            bookingType == BookingType.upcoming
                ? Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DefaultText(text: "Remind me", style: Get.theme.textTheme.titleMedium!),
                        Transform.scale(scale: 0.8, child: CupertinoSwitch(value: true, onChanged: (val) {}))
                      ],
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: bookingType == BookingType.complete ? kPrimaryColor : Colors.red),
                    padding: const EdgeInsets.all(10),
                    child: DefaultText(
                      text: bookingType == BookingType.complete ? "Complete" : "Cancelled",
                      style: Get.theme
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.bold, color: kScaffoldBackgroundColor),
                    ),
                  ),
          ],
        ),

        //Location
        const Divider(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: "99 PRospect Park W",
                    style: Get.theme.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  DefaultText(
                    text: "Brooklyn, 99 Projespect Park W",
                    style: Get.theme.textTheme.labelMedium!.copyWith(height: 2),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed(RouteConst.kGoToDirection),
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

        //Charger info
        const Divider(height: 30),
        IntrinsicHeight(
          child: Row(
            children: [
              getTitleAndSubtitle("Tesla (Plug)", ""),
              const VerticalDivider(thickness: 1.2),
              getTitleAndSubtitle("Max.Power", "100 kW"),
              const VerticalDivider(thickness: 1.2),
              getTitleAndSubtitle("Duration", "1 hour"),
              const VerticalDivider(thickness: 1.2),
              getTitleAndSubtitle("Amount", "\$14.25"),
            ],
          ),
        ),

        //Buttons
        const Divider(height: 30),
        Row(
          children: [
            Expanded(
              child: CustomOutlineButton(
                onPressed: () {
                  // Get.toNamed("${RouteConst.kHome}/${RouteConst.kViewDetailsInfo}");
                },
                child: DefaultText(
                  text: bookingType == BookingType.upcoming ? "Cancel Booking" : "View",
                  style: Get.theme
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            if (bookingType == BookingType.upcoming || bookingType == BookingType.complete) WidgetConst.kWidthSpacer(),
            if (bookingType == BookingType.upcoming || bookingType == BookingType.complete)
              Expanded(
                child: CustomOutlineButton(
                  backgroundColor: kPrimaryColor,
                  onPressed: () => Get.toNamed(RouteConst.kReviewSummary, arguments: "booking"),
                  child: DefaultText(
                    text: bookingType == BookingType.upcoming ? "View" : "Booking Again",
                    style: Get.theme
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.bold, color: kScaffoldBackgroundColor),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
          ],
        ),

        if (bookingType == BookingType.upcoming)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Get.theme.brightness == Brightness.light ? kSecondaryColor : kPrimaryColor.withOpacity(0.4),
            ),
            margin: const EdgeInsets.only(top: 10),
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
                    style: Get.theme
                        .textTheme
                        .titleMedium!
                        .copyWith(color: kSecondaryTextColor, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
      ]),
    );
  }

  Expanded getTitleAndSubtitle(String title, String subtitle) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(
            text: title,
            style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w300),
            textAlign: TextAlign.start,
          ),
          if (subtitle != "")
            DefaultText(
              text: subtitle,
              style: Get.theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, height: 2),
              textAlign: TextAlign.center,
            ),
          if (subtitle == "") const Padding(padding: EdgeInsets.only(top: 6), child: Icon(Icons.pages_outlined)),
        ],
      ),
    );
  }
}
