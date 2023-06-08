import 'package:evpoint/utils/imports.dart';

class AddVehicleScreen extends StatelessWidget {
  const AddVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //Title - Message
            DefaultText(
              text: StringsConst.kTextAddVehicleTitle,
              style: Get.theme.textTheme.headlineSmall!.copyWith(height: 1.5),
              maxLines: 3,
              textAlign: TextAlign.start,
            ),
            WidgetConst.kHeightSpacer(),
            DefaultText(
              text: StringsConst.kTextAddVehicleMessage,
              style: Get.theme.textTheme.titleMedium!.copyWith(height: 1.7, fontWeight: FontWeight.normal),
              textAlign: TextAlign.start,
              maxLines: 3,
            ),

            //Full Name
            WidgetConst.kHeightSpacer(heightMultiplier: 4),
            Image.asset(Get.theme.brightness == Brightness.light
                ? StringsConst.kAddVehicle
                : StringsConst.kAddVehicleDark),

            const Spacer(),

            //Continue Button
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 50,
                    child: CustomElevatedButton(
                      onPressed: () => Get.offNamed(RouteConst.kLogin),
                      elevation: 0,
                      text: StringsConst.kTextAddLater,
                      style: Get.theme.textTheme.labelLarge!.copyWith(
                          color: Get.theme.brightness == Brightness.dark ? kThirdTextColor : kPrimaryColor),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: CustomElevatedButton(
                      onPressed: () {
                        // String? error = FirebaseAuthController.instance
                        //     .createUserWithEmailAndPassword("a@mailinator.com", "Test@123") as String?;
                        // if (error != null) {
                        //   Get.snackbar("Error", error);
                        // }
                      },
                      text: StringsConst.kTextAddVehicle,
                      backgroundColor: kPrimaryColor,
                      style: Get.theme.textTheme.labelLarge!.copyWith(color: kThirdTextColor),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
