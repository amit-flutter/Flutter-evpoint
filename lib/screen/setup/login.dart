import 'package:evpoint/utils/imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Image
                Image.asset(
                  Get.theme.brightness == Brightness.light
                      ? StringsConst.kImgLogin
                      : StringsConst.kImgLoginDark,
                  height: 300,
                  fit: BoxFit.fitHeight,
                ),
                //Welcome text
                DefaultText(
                  text: StringsConst.kTextLetsYouIn,
                  style: Get.theme.textTheme.headlineMedium!,
                ),

                //Social Login Buttons
                for (String socialName in [
                  StringsConst.kTextGoogle,
                  StringsConst.kTextApple,
                  StringsConst.kTextFacebook
                ])
                  SizedBox(
                    height: 50,
                    child: CustomOutlineButton(
                        backgroundColor:
                            Get.theme.brightness == Brightness.light ? Colors.transparent : kDarkSecondaryColor,
                        onPressed: () => FirebaseAuthController.instance.socialLogin(socialName),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Get.theme.brightness == Brightness.light
                                ? Image.asset('assets/images/$socialName.png', height: 25)
                                : socialName != "Apple"
                                    ? Image.asset('assets/images/$socialName.png', height: 25)
                                    : Image.asset('assets/images/$socialName.png', height: 25, color: Colors.white),
                            WidgetConst.kWidthSpacer(),
                            DefaultText(
                              text: "${StringsConst.kTextContinue} $socialName",
                              style: Get.theme
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(height: 1.5, fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                  ),

                //Divider
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DefaultText(
                        text: StringsConst.kTextOr,
                        style: Get.theme.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),

                //Phone Number Sign in button
                SizedBox(
                    height: 50,
                    width: Get.width,
                    child: CustomElevatedButton(
                      onPressed: () => Get.toNamed(RouteConst.kSignIn),
                      text: StringsConst.kTextSignPhoneNumber,
                      style: Get.theme.textTheme.labelLarge!.copyWith(color: kThirdTextColor),
                      backgroundColor: kPrimaryColor,
                    )),

                //don't have account text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultText(
                      text: StringsConst.kTextDonHaveAccount,
                      style:
                          Get.theme.textTheme.labelLarge!.copyWith(height: 1.5, fontWeight: FontWeight.normal),
                    ),
                    WidgetConst.kWidthSpacer(),
                    InkWell(
                      onTap: () => Get.toNamed(RouteConst.kSignUp),
                      child: DefaultText(
                        text: StringsConst.kTextSignUp,
                        style: Get.theme
                            .textTheme
                            .labelLarge!
                            .copyWith(height: 1.5, fontWeight: FontWeight.w600, color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
