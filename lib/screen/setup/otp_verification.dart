import 'package:evpoint/utils/imports.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

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
              text: StringsConst.kTextOTPCodeVerification,
              style: Get.theme.textTheme.headlineSmall!.copyWith(height: 1.5),
            ),
            WidgetConst.kHeightSpacer(),
            DefaultText(
              text: StringsConst.kTextOTPCodeVerificationMessage(Get.parameters['message']!),
              style: Get.theme.textTheme.titleMedium!.copyWith(height: 1.7, fontWeight: FontWeight.normal),
              textAlign: TextAlign.start,
              maxLines: 3,
            ),

            //PinPut
            WidgetConst.kHeightSpacer(heightMultiplier: 6),
            Center(child: buildPinPut(context)),

            //Other Options
            WidgetConst.kHeightSpacer(heightMultiplier: 3),
            Center(
              child: DefaultText(
                text: StringsConst.kTextDonTReceiveEmail,
                style: Get.theme.textTheme.titleMedium!.copyWith(height: 1.7, fontWeight: FontWeight.normal),
                maxLines: 3,
              ),
            ),
            WidgetConst.kHeightSpacer(),
            Center(
              child: DefaultText(
                text: StringsConst.kTextResendCode,
                style: Get.theme.textTheme.titleMedium!.copyWith(height: 1.7, fontWeight: FontWeight.normal),
                maxLines: 3,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildPinPut(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: Get.theme.textTheme.headlineSmall!,
      decoration: BoxDecoration(
        border: Border.all(color: kDarkSecondaryTextColor.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(15),
        color: kDarkSecondaryTextColor.withOpacity(0.1),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
        border: Border.all(color: kPrimaryColor),
        color: Get.theme.brightness == Brightness.light ? kSecondaryColor : kDarkSecondaryColor);

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      validator: (s) {
        return s == '2222' ? null : 'Pin is incorrect';
      },
      listenForMultipleSmsOnAndroid: false,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      length: 6,
      onCompleted: (pin) async {
        if (await FirebaseAuthController.instance.verifyOTP(pin)) {
          if (Get.parameters['routeFrom'] == RouteConst.kSignUp) {
            Get.offNamed(RouteConst.kCompleteYourProfile);
          } else if (context.mounted) {
            showCustomDialog(
              context: context,
              customDialogUI: CustomDialogUI(
                logoImage: Get.theme.brightness == Brightness.light
                    ? StringsConst.kDoneBubble
                    : StringsConst.kDoneBubbleDark,
                title: "Verification Successful!",
                subTitle: "Please Wait...\nYou will be directed to the homepage.",
                lastImage: StringsConst.kLoader,
              ),
            );
            Future.delayed(const Duration(seconds: 2), () => Get.back());
            Future.delayed(const Duration(seconds: 3), () => Get.offAllNamed(RouteConst.kPreHome));
          }
        }
      },
    );
  }
}
