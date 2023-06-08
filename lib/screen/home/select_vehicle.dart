import 'package:evpoint/utils/imports.dart';

class SelectVehicle extends StatelessWidget {
  const SelectVehicle({Key? key}) : super(key: key);

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
                text: "Select Your Vehicle", style: Get.theme.textTheme.headlineSmall!.copyWith(fontSize: 20)),
            actions: [
              IconButton(
                constraints: const BoxConstraints(minWidth: 70),
                onPressed: () {},
                icon: const Icon(Icons.add, size: 34),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const SelectVehicleCard(
                    carImage: Icon(Icons.car_crash, size: 60),
                    carName: "Tesla",
                    carDescription: "Model s - 400",
                  );
                }),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 50,
            width: Get.width - 40,
            child: CustomOutlineButton(
              backgroundColor: kPrimaryColor,
              onPressed: () => Get.toNamed(RouteConst.kSelectCharger),
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

class SelectVehicleCard extends StatelessWidget {
  const SelectVehicleCard({
    super.key,
    required this.carImage,
    required this.carName,
    required this.carDescription,
    this.isFinalCard = false,
  });

  final Widget carImage;
  final String carName;
  final String carDescription;
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
            carImage,
            const VerticalDivider(thickness: 1.2),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: carName,
                    style: Get.theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  DefaultText(
                    text: carDescription,
                    style: Get.theme
                        .textTheme
                        .titleMedium!
                        .copyWith(color: kSecondaryTextColor, fontWeight: FontWeight.w500),
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
