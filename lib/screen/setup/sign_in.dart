import 'package:evpoint/utils/imports.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              text: StringsConst.kTextSignInMessage,
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
              onSubmitted: (phone) =>
                  FirebaseAuthController.instance.phoneAuthentication("+91$phone", RouteConst.kSignIn),
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
                DefaultText(
                  text: StringsConst.kTextRememberMe,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                  maxLines: 3,
                ),
              ],
            ),

            WidgetConst.kHeightSpacer(heightMultiplier: 2),
            const Divider(),
            WidgetConst.kHeightSpacer(heightMultiplier: 2),
            Center(
              child: DefaultText(
                text: StringsConst.kTextCanTAccessYourPhone,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            WidgetConst.kHeightSpacer(heightMultiplier: 2),
            Center(
              child: DefaultText(
                text: StringsConst.kTextUserEmailTOSignIn,
                style:
                    Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
              ),
            ),
            WidgetConst.kHeightSpacer(heightMultiplier: 3),

            //Divider
            Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DefaultText(
                    text: StringsConst.kTextOrContinueWith,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),

            WidgetConst.kHeightSpacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                for (String socialName in [
                  StringsConst.kTextGoogle,
                  StringsConst.kTextApple,
                  StringsConst.kTextFacebook
                ])
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      child: CustomOutlineButton(
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.light ? Colors.transparent : kDarkSecondaryColor,
                        onPressed: () => FirebaseAuthController.instance.socialLogin(socialName),
                        child: Theme.of(context).brightness == Brightness.light
                            ? Image.asset('assets/images/$socialName.png', height: 25)
                            : socialName != "Apple"
                                ? Image.asset('assets/images/$socialName.png', height: 25)
                                : Image.asset('assets/images/$socialName.png', height: 25, color: Colors.white),
                      ),
                    ),
                  ),
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
                  var data = {"routeFrom": RouteConst.kSignIn, "message": "+919106129524"};
                  Get.toNamed(RouteConst.kOtpVerification, parameters: data);
                },
                text: "Sign In",
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
