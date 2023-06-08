import 'package:evpoint/utils/imports.dart';

class CompleteYourProfileScreen extends StatelessWidget {
  const CompleteYourProfileScreen({Key? key}) : super(key: key);

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
              text: StringsConst.kTextCompleteYourProfile,
              style: Get.theme.textTheme.headlineSmall!.copyWith(height: 1.5),
            ),
            WidgetConst.kHeightSpacer(),
            DefaultText(
              text: StringsConst.kTextCompleteYourProfileMessage,
              style: Get.theme.textTheme.titleMedium!.copyWith(height: 1.7, fontWeight: FontWeight.normal),
              textAlign: TextAlign.start,
              maxLines: 3,
            ),

            //Full Name
            WidgetConst.kHeightSpacer(heightMultiplier: 2),
            CustomTextField(
              title: StringsConst.kTextFullName,
              keyBoardType: TextInputType.name,
              textFieldController: TextEditingController(),
            ),

            //Email
            WidgetConst.kHeightSpacer(heightMultiplier: 3),
            CustomTextField(
              title: StringsConst.kTextEmail,
              keyBoardType: TextInputType.emailAddress,
              textFieldController: TextEditingController(),
            ),

            //Gender
            WidgetConst.kHeightSpacer(heightMultiplier: 3),
            const CustomDropDown(title: StringsConst.kTextGender, list: <String>['Male', 'Female', 'Other']),

            //Date of Birth
            const CustomDatePicker(title: StringsConst.kTextDateOfBirth),

            const Spacer(),

            //Continue Button
            const Divider(),
            SizedBox(
              width: Get.width,
              height: 50,
              child: CustomElevatedButton(
                onPressed: () => Get.toNamed(RouteConst.kAddVehicle),
                text: "Continue",
                backgroundColor: kPrimaryColor,
                style: Get.theme.textTheme.labelLarge!.copyWith(color: kThirdTextColor),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
