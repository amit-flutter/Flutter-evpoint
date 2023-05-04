import 'package:evpoint/controller/app_common.dart';
import 'package:evpoint/utils/imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCommonController appCommonController = Get.put(AppCommonController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await FirebaseAuthController.instance.logout();
          },
          icon: Icon(Icons.exit_to_app),
        ),
      ),
      body: SizedBox(
        width: Get.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(),
            const Text("All The Very Best Of Luck\nFor New Project Setup", textAlign: TextAlign.center),
            Obx(() {
              return Text("Version: ${appCommonController.packageInfo.value.version}");
            })
          ],
        ),
      ),
    );
  }
}
