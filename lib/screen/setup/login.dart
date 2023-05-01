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
                  Theme.of(context).brightness == Brightness.light
                      ? StringsConst.kImgLogin
                      : StringsConst.kImgLoginDark,
                  height: 300,
                  fit: BoxFit.fitHeight,
                ),
                //Welcome text
                DefaultText(
                  text: StringsConst.kTextLetsYouIn,
                  style: Theme.of(context).textTheme.headlineMedium!,
                ),

                //Social Login Buttons
                for (String socialName in ['Google', 'Facebook', 'Apple'])
                  SizedBox(
                    height: 50,
                    child: CustomOutlineButton(
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.light ? Colors.transparent : kDarkSecondaryColor,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (Theme.of(context).brightness == Brightness.light)
                              Image.asset('assets/images/$socialName.png', height: 25),
                            socialName != "Apple" && Theme.of(context).brightness == Brightness.dark
                                ? Image.asset('assets/images/$socialName.png', height: 25)
                                : Image.asset('assets/images/$socialName.png', height: 25, color: Colors.white),
                            WidgetConst.kWidthSpacer(),
                            DefaultText(
                              text: "${StringsConst.kTextContinue} $socialName",
                              style: Theme.of(context)
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
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w400),
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
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(color: kThirdTextColor),
                      backgroundColor: kPrimaryColor,
                    )),

                //don't have account text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultText(
                      text: StringsConst.kTextDonHaveAccount,
                      style:
                          Theme.of(context).textTheme.labelLarge!.copyWith(height: 1.5, fontWeight: FontWeight.normal),
                    ),
                    WidgetConst.kWidthSpacer(),
                    InkWell(
                      onTap: () => Get.toNamed(RouteConst.kSignUp),
                      child: DefaultText(
                        text: StringsConst.kTextSignUp,
                        style: Theme.of(context)
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
