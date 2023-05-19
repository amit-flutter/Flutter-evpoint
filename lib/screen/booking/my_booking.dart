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
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: CustomAppBar(
            title: "My Booking",
            bottom: TabBar(
              labelColor: kPrimaryColor,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              padding: EdgeInsets.symmetric(horizontal: 20),
              tabs: [Tab(text: "Upcoming"), Tab(text: "Complete"), Tab(text: "Canceled")],
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
        color: kFifthTextColor,
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
                  DefaultText(text: "Date 05, 2024", style: Theme.of(context).textTheme.titleMedium!),
                  DefaultText(
                      text: "Time 12:44 PM", style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 2)),
                ],
              ),
            ),

            ///[Dynamic-Widget] it will take booking card type and change ui as per requirement.
            bookingType == BookingType.upcoming
                ? Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DefaultText(text: "Remind me", style: Theme.of(context).textTheme.titleMedium!),
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
                      style: Theme.of(context)
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
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  DefaultText(
                    text: "Brooklyn, 99 Projespect Park W",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(height: 2),
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
              getTitleAndSubtitle(context, "Tesla (Plug)", ""),
              const VerticalDivider(thickness: 1.2),
              getTitleAndSubtitle(context, "Max.Power", "100 kW"),
              const VerticalDivider(thickness: 1.2),
              getTitleAndSubtitle(context, "Duration", "1 hour"),
              const VerticalDivider(thickness: 1.2),
              getTitleAndSubtitle(context, "Amount", "\$14.25"),
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
                  style: Theme.of(context)
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
                    style: Theme.of(context)
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
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: kSecondaryColor),
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
                    style: Theme.of(context)
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

  Expanded getTitleAndSubtitle(BuildContext context, String title, String subtitle) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(
            text: title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w300),
            textAlign: TextAlign.start,
          ),
          if (subtitle != "")
            DefaultText(
              text: subtitle,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, height: 2),
              textAlign: TextAlign.center,
            ),
          if (subtitle == "") const Padding(padding: EdgeInsets.only(top: 6), child: Icon(Icons.pages_outlined)),
        ],
      ),
    );
  }
}
