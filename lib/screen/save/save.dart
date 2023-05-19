import 'package:evpoint/screen/home/station_map_view.dart';
import 'package:evpoint/screen/widgets/small_widget.dart';
import 'package:evpoint/utils/constant/strings.dart';
import 'package:evpoint/utils/constant/theme.dart';
import 'package:flutter/material.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(50.0), child: CustomAppBar()),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const LocationInfoCard(
                backgroundColor: kFifthTextColor,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              );
            }),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 10,
      // leadingWidth: 30,
      centerTitle: false,
      leading: Padding(padding: const EdgeInsets.only(left: 30), child: Image.asset(StringsConst.kImgAppIcon)),
      title: DefaultText(
        text: "Saved",
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
      ),
      actions: const [Padding(padding: EdgeInsets.only(right: 30), child: Icon(Icons.search, size: 30))],
    );
  }
}
