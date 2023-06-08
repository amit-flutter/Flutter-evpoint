import 'package:evpoint/utils/imports.dart';
import 'package:flutter/cupertino.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: CustomAppBar(
            title: "Account",
            action: [Padding(padding: EdgeInsets.only(right: 15), child: Icon(Icons.more_horiz, size: 30))],
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const ProfileSection(),
              const Divider(endIndent: 20, indent: 20),
              getListTile(
                context: context,
                title: "My Vehicle",
                leadingIcon: Icons.car_rental_sharp,
                onTap: () => Get.toNamed(RouteConst.kAddVehicle),
              ),
              getListTile(
                context: context,
                title: "Payment Methods",
                leadingIcon: Icons.payment_rounded,
                onTap: () => Get.toNamed(RouteConst.kSelectPaymentMethod),
              ),
              const Divider(endIndent: 20, indent: 20),
              getListTile(context: context, title: "Personal Info", leadingIcon: Icons.person_3_outlined, onTap: () {}),
              getListTile(context: context, title: "Security", leadingIcon: Icons.security, onTap: () {}),
              getListTile(context: context, title: "Language", leadingIcon: Icons.sticky_note_2_outlined, onTap: () {}),
              getListTile(
                  context: context, title: "Dark Mode", leadingIcon: Icons.remove_red_eye_outlined, onTap: () {}),
              const Divider(endIndent: 20, indent: 20),
              getListTile(context: context, title: "Help Center", leadingIcon: Icons.note_alt_outlined, onTap: () {}),
              getListTile(
                  context: context, title: "Privacy Policy", leadingIcon: Icons.lock_outline_rounded, onTap: () {}),
              getListTile(
                  context: context, title: "About EVPoint", leadingIcon: Icons.info_outline_rounded, onTap: () {}),
              getListTile(
                  context: context,
                  title: "Logout",
                  leadingIcon: Icons.exit_to_app_rounded,
                  onTap: () => FirebaseAuthController.instance.logout()),
            ],
          ),
        ),
      ),
    );
  }

  ListTile getListTile(
      {required context, required String title, required IconData leadingIcon, required Function() onTap}) {
    return ListTile(
      leading: Icon(leadingIcon,
          size: 30, color: title == "Logout" ? Colors.red : Theme.of(context).textTheme.titleMedium!.color),
      title: DefaultText(
        text: title,
        style: title == "Logout"
            ? Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.red)
            : Theme.of(context).textTheme.titleLarge!,
        textAlign: TextAlign.start,
      ),
      trailing: title == "Dark Mode"
          ? const DarkModeToggleButton()
          : title == "Logout"
              ? const SizedBox.shrink()
              : Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).textTheme.titleMedium!.color),
      onTap: onTap,
    );
  }
}

class DarkModeToggleButton extends StatefulWidget {
  const DarkModeToggleButton({super.key});

  @override
  State<DarkModeToggleButton> createState() => _DarkModeToggleButtonState();
}

class _DarkModeToggleButtonState extends State<DarkModeToggleButton> {
  bool isDark = false;

  @override
  void initState() {
    getDarkValue();
    super.initState();
  }

  Future<void> getDarkValue() async {
    isDark = await Preferences.isDark();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
            value: isDark,
            onChanged: (val) async {
              isDark = val;
              await Preferences.setDarkMode(val);
              setState(() => Get.changeThemeMode(val ? ThemeMode.dark : ThemeMode.light));
            }));
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 45,
            backgroundImage:
                NetworkImage("https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/profile-photos-4.jpg"),
          ),
          WidgetConst.kWidthSpacer(),
          Column(
            children: [
              DefaultText(
                text: "Andrew Ainsley",
                style: Theme.of(context).textTheme.titleLarge!,
                textAlign: TextAlign.start,
              ),
              DefaultText(
                text: "+1 111 123 345 544",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 2),
                textAlign: TextAlign.start,
              )
            ],
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios_rounded, color: Get.theme.textTheme.titleMedium!.color)
        ],
      ),
    );
  }
}
