import 'package:evpoint/utils/imports.dart';

class StationListView extends StatelessWidget {
  const StationListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kScaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            //Search and FilterBar
            Container(
              margin: const EdgeInsets.all(20),
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        hintText: "Search Station",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontWeight: FontWeight.bold, color: kSecondaryTextColor),
                        prefixIcon: const Icon(Icons.search),
                        border: StyleConst.outlineNoBorder,
                        enabledBorder: StyleConst.outlineNoBorder,
                        focusedBorder: StyleConst.outlineNoBorder,
                        filled: true,
                        fillColor: kDarkSecondaryTextColor.withOpacity(0.1),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 50,
                    width: 50,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kDarkSecondaryTextColor.withOpacity(0.1),
                    ),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list_outlined),
                    ),
                  )
                ],
              ),
            ),

            //Map View / List View
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  itemCount: 15,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    return const StationInfoListTile();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StationInfoListTile extends StatelessWidget {
  const StationInfoListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(horizontal: -3),
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(StringsConst.kImgAppIcon),
      title: DefaultText(
        text: "CodzGarage SoftWare Development Private Limited Compnay",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
      ),
      subtitle: DefaultText(
        text: "201,Zion Prime, Near: Thaltej-Shilaj Bridge, Thaltej, Ahmedabad",
        style: Theme.of(context).textTheme.labelMedium!,
        textAlign: TextAlign.start,
        maxLines: 2,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.chevron_right_rounded),
        onPressed: () {},
        splashRadius: 25,
      ),
    );
  }
}
