import 'package:evpoint/utils/imports.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
              text: StringsConst.kTextHelloThere,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(height: 1.5),
            ),
            WidgetConst.kHeightSpacer(),
            DefaultText(
              text: StringsConst.kTextSignUpMessage,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.7, fontWeight: FontWeight.normal),
              textAlign: TextAlign.start,
              maxLines: 3,
            ),
            WidgetConst.kHeightSpacer(heightMultiplier: 3),

            //Phone Number
            DefaultText(
              text: StringsConst.kTextPhoneNumber,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(height: 1.7, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
              maxLines: 3,
            ),

            //Phone Number Piker Widget
            WidgetConst.kHeightSpacer(),
            IntlPhoneField(
              initialCountryCode: 'IN',
              onChanged: (phone) {},
              dropdownIconPosition: IconPosition.trailing,
              dropdownIcon: const Icon(Icons.keyboard_arrow_down_rounded),
            ),
            // const Divider(color: kPrimaryColor, thickness: 1.2, height: 1),

            //Policy Privacy
            WidgetConst.kHeightSpacer(),
            Row(
              children: [
                Checkbox(value: true, onChanged: (val) {}),
                WidgetConst.kWidthSpacer(),
                Expanded(
                  child: RichText(
                    maxLines: 3,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(height: 1.7, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        const TextSpan(text: 'i afree to EVPouint'),
                        for (String i in [" Public Agreement,", " Terms,", " Privacy Policy"])
                          TextSpan(
                              text: i,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(height: 1.5, fontWeight: FontWeight.w600, color: kPrimaryColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Logger.logPrint(title: i);
                                }),
                        const TextSpan(text: ', and confirm that i am over 17 years old '),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),

            //Continue Button
            const Divider(),
            SizedBox(
              width: Get.width,
              height: 50,
              child: CustomElevatedButton(
                onPressed: () {
                  var data = {"routeFrom": RouteConst.kSignUp, "message": "+912222222222"};
                  Get.toNamed(RouteConst.kOtpVerification, parameters: data);
                },
                text: "Continue",
                backgroundColor: kPrimaryColor,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(color: kThirdTextColor),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
