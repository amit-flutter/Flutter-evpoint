import 'package:evpoint/utils/imports.dart';

class SelectPaymentMethod extends StatelessWidget {
  const SelectPaymentMethod({Key? key}) : super(key: key);

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
                text: "Select Payment Method",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 20)),
            actions: [
              IconButton(
                constraints: const BoxConstraints(minWidth: 70),
                onPressed: () {},
                icon: const Icon(Icons.qr_code_outlined, size: 34),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: StringsConst.kSelectPayment.length + 1,
                itemBuilder: (context, index) {
                  return StringsConst.kSelectPayment.length != index
                      ? SelectPaymentCard(
                          paymentImage: Icon(StringsConst.kSelectPayment[index][0], size: 50),
                          paymentMethodName: StringsConst.kSelectPayment[index][1],
                          paymentAmount: '100',
                        )
                      : Container(
                          margin: const EdgeInsets.all(20),
                          height: 50,
                          child: CustomElevatedButton(
                            onPressed: () => Get.offNamed(RouteConst.kLogin),
                            text: "+ Add New Payment",
                            elevation: 0,
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color:
                                    Theme.of(context).brightness == Brightness.dark ? kThirdTextColor : kPrimaryColor),
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
              onPressed: () => Get.toNamed(RouteConst.kReviewSummary),
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
        ]),
      ),
    );
  }
}

class SelectPaymentCard extends StatelessWidget {
  const SelectPaymentCard({
    super.key,
    required this.paymentImage,
    required this.paymentMethodName,
    required this.paymentAmount,
    this.isFinalCard = false,
  });

  final Widget paymentImage;
  final String paymentMethodName;
  final String paymentAmount;
  final bool isFinalCard;

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
      child: IntrinsicHeight(
        child: Row(
          children: [
            paymentImage,
            WidgetConst.kWidthSpacer(),
            Expanded(
              child: DefaultText(
                text: paymentMethodName,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            if (!isFinalCard) Radio(value: 2, groupValue: "2", visualDensity: VisualDensity.compact, onChanged: (v) {})
          ],
        ),
      ),
    );
  }
}
