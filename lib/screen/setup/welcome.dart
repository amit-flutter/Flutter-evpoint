import 'package:evpoint/utils/imports.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _activePage = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Banner Images
            const SizedBox(),
            SizedBox(
              height: Get.width,
              child: PageView.builder(
                  itemCount: StringsConst.kWelcomeNotes.length,
                  controller: _pageController,
                  onPageChanged: (page) => setState(() => _activePage = page),
                  itemBuilder: (context, pagePosition) {
                    return Image.asset(
                      'assets/images/welcome${Theme.of(context).brightness == Brightness.dark ? "Dark" : ""}${pagePosition + 1}.png',
                    );
                  }),
            ),

            //Welcome Title and subTitle
            DefaultText(
              text: StringsConst.kWelcomeNotes[_activePage][0],
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(height: 1.5),
              maxLines: 2,
            ),
            DefaultText(
              text: StringsConst.kWelcomeNotes[0][1],
              style: Theme.of(context).textTheme.labelLarge!.copyWith(height: 1.5, fontWeight: FontWeight.normal),
              maxLines: 2,
            ),
            //Progress Dot
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i in [0, 1, 2])
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: _activePage == i ? kPrimaryColor : kDarkSecondaryTextColor,
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: _activePage == i
                              ? <Color>[kPrimaryColor.withOpacity(0.3), kPrimaryColor]
                              : <Color>[kDarkSecondaryTextColor, kDarkSecondaryTextColor],
                        ),
                        borderRadius: BorderRadius.circular(4)),
                    width: _activePage == i ? 30 : 7,
                    height: 7,
                  )
              ],
            ),

            //Skip - Next Button
            WidgetConst.kHeightSpacer(),
            Column(
              children: [
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 50,
                        child: CustomElevatedButton(
                          onPressed: () => Get.offNamed(RouteConst.kLogin),
                          text: StringsConst.kTextSkip,
                          elevation: 0,
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Theme.of(context).brightness == Brightness.dark ? kThirdTextColor : kPrimaryColor),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 50,
                        child: CustomElevatedButton(
                          onPressed: () async {
                            _activePage < 2
                                ? await _pageController.nextPage(
                                    duration: const Duration(milliseconds: 600), curve: Curves.ease)
                                : Get.offNamed(RouteConst.kLogin);
                          },
                          text: StringsConst.kTextNext,
                          backgroundColor: kPrimaryColor,
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: kThirdTextColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
