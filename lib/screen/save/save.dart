import 'package:evpoint/utils/imports.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(50.0), child: CustomAppBar(title: "Save")),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return LocationInfoCard(
                backgroundColor:
                    Get.theme.brightness == Brightness.light ? kFifthTextColor : kDarkSecondaryColor,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              );
            }),
      ),
    );
  }
}
