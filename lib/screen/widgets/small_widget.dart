import 'dart:ui';

import 'package:evpoint/utils/imports.dart';

class WidgetConst {
  static Widget kHeightSpacer({double heightMultiplier = 1}) => SizedBox(height: 10 * heightMultiplier);
  static Widget kWidthSpacer({double widthMultiplier = 1}) => SizedBox(width: 10 * widthMultiplier);

  Future<void> showCustomDialog(
    BuildContext context, {
    required String title,
    required String content,
    required String button1Text,
    required String button2Text,
    required Function() button1OnTap,
    required Function() button2OnTap,
  }) =>
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
                onPressed: button1OnTap,
                child: Text(button1Text),
              ),
              TextButton(
                style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
                onPressed: button2OnTap,
                child: Text(button2Text),
              ),
            ],
          );
        },
      );
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.leading = const SizedBox(),
    required this.title,
    this.action = const [Padding(padding: EdgeInsets.only(right: 20), child: Icon(Icons.search, size: 30))],
    this.bottom = const PreferredSize(preferredSize: Size(0, 0), child: SizedBox()),
  });

  final Widget leading;
  final String title;
  final List<Widget> action;
  final PreferredSizeWidget bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 10,
      centerTitle: false,
      leading: Padding(padding: const EdgeInsets.only(left: 15), child: Image.asset(StringsConst.kImgAppIcon)),
      title: DefaultText(
        text: title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
      ),
      actions: action,
      bottom: bottom,
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.style = StyleConst.kDefaultTextStyle,
      this.textAlign = TextAlign.center,
      this.maxLines = 1,
      this.borderRadius = 25,
      this.backgroundColor,
      this.elevation = 15})
      : super(key: key);

  final Function() onPressed;
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final int maxLines;
  final double borderRadius;
  final Color? backgroundColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))),
      ),
      child: DefaultText(text: text, maxLines: maxLines, style: style, textAlign: textAlign),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.borderRadius = 25,
      this.backgroundColor,
      this.elevation = 15})
      : super(key: key);

  final Function() onPressed;
  final Widget child;
  final double borderRadius;
  final Color? backgroundColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))),
      ),
      child: child,
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    required this.keyBoardType,
    this.isHideTitle = false,
    this.isSecureText = false,
    this.isSuffixIcon = false,
    this.validation,
    required this.textFieldController,
  }) : super(key: key);

  final String title;
  final TextInputType keyBoardType;
  final bool isHideTitle;
  final bool isSecureText;
  final bool isSuffixIcon;

  final String? Function(String?)? validation;
  final TextEditingController textFieldController;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(
            text: widget.title,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          TextFormField(
            keyboardType: widget.keyBoardType,
            obscureText: widget.isSecureText && _passwordVisible,
            validator: widget.validation,
            controller: widget.textFieldController,
            decoration: InputDecoration(
              //  labelText: widget.title,
              hintText: widget.title,
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.bold, color: kSecondaryTextColor),

              // hintStyle: WidgetConst.kHighLightDark18.copyWith(color: Colors.grey),
              suffixIcon: widget.isSuffixIcon
                  ? IconButton(
                      padding: const EdgeInsets.only(right: 20),
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                        // color: ColorConst.kHighLight3,
                        size: 30,
                      ),
                      onPressed: () => setState(() => _passwordVisible = !_passwordVisible),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}

class DefaultText extends StatelessWidget {
  const DefaultText({
    Key? key,
    required this.text,
    this.style = StyleConst.kDefaultTextStyle,
    this.textAlign = TextAlign.center,
    this.maxLines = 1,
  }) : super(key: key);

  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style, textAlign: textAlign, maxLines: maxLines);
  }
}

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({Key? key, required this.title, required this.list}) : super(key: key);

  final String title;
  final List<String> list;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late String dropdownValue;
  @override
  void initState() {
    dropdownValue = widget.list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          text: widget.title,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 55,
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.keyboard_arrow_down_rounded, color: kPrimaryColor, size: 35),
            isExpanded: true,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
            underline: Container(height: 2, color: kPrimaryColor),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: widget.list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        WidgetConst.kHeightSpacer(heightMultiplier: 3),
        DefaultText(
          text: widget.title,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        WidgetConst.kHeightSpacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultText(
              text: selectedDate == null ? StringsConst.kTextDateFormat : "${selectedDate!.toLocal()}".split(' ')[0],
              style: selectedDate == null
                  ? Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.bold, color: kSecondaryTextColor)
                  : Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () => _selectDate(context),
              icon: const Icon(Icons.calendar_month, color: kPrimaryColor),
              padding: const EdgeInsets.only(top: 10, right: 7),
              constraints: const BoxConstraints(),
            )
          ],
        )
      ],
    );
  }
}

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  String selectedTime = "HH:MM";

  Future<void> _selectDate(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(initialTime: TimeOfDay.now(), context: context);

    if (pickedTime != null) {
      // print(pickedTime.format(context)); //output 10:// 51 PM
      // DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
      // //converting to DateTime so that we can further format on different pattern.
      // print(parsedTime); //output 1970-01-01 22:53:00.000
      // String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
      // print(formattedTime); //output 14:59:00
      // //DateFormat() is from intl package, you can format the time on any pattern you need.
      setState(() => selectedTime = pickedTime.format(context).toString());
    } else {
      Logger.logPrint(title: "Time is not selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        WidgetConst.kHeightSpacer(),
        DefaultText(
          text: widget.title,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        WidgetConst.kHeightSpacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultText(
              text: selectedTime == "HH:MM" ? "HH:MM" : selectedTime,
              style: selectedTime == "HH:MM"
                  ? Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.bold, color: kSecondaryTextColor)
                  : Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () => _selectDate(context),
              icon: const Icon(Icons.access_time_rounded, color: kPrimaryColor),
              padding: const EdgeInsets.only(right: 7),
              constraints: const BoxConstraints(),
            )
          ],
        )
      ],
    );
  }
}

class CustomDialogUI extends StatelessWidget {
  const CustomDialogUI({
    Key? key,
    required this.logoImage,
    required this.title,
    required this.subTitle,
    required this.lastImage,
    this.bottomWidget = const SizedBox(),
  }) : super(key: key);

  final String logoImage;
  final String title;
  final String subTitle;
  final String lastImage;
  final Widget bottomWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(logoImage, height: Get.width / 2),
        DefaultText(
            text: title, style: Theme.of(context).textTheme.headlineSmall!.copyWith(height: 1.5, color: kPrimaryColor)),
        WidgetConst.kHeightSpacer(),
        DefaultText(
          text: subTitle,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.7, fontWeight: FontWeight.normal),
          maxLines: 3,
        ),
        WidgetConst.kHeightSpacer(heightMultiplier: 2),
        if (lastImage != "") Image.asset(lastImage, width: Get.width / 5),
        bottomWidget
      ],
    );
  }
}

Future<void> showCustomDialog({required BuildContext context, required Widget customDialogUI}) async {
  await showGeneralDialog(
    context: context,
    barrierLabel: "Show Dialog",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    useRootNavigator: true,
    pageBuilder: (_, __, ___) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Center(
          child: Container(
            // height: Get.height * 0.5,
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color:
                    Theme.of(context).brightness == Brightness.light ? kScaffoldBackgroundColor : kDarkFourthTextColor,
                borderRadius: BorderRadius.circular(40)),
            child: SizedBox(child: customDialogUI),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(
          begin: anim.status == AnimationStatus.reverse ? const Offset(-1, 0) : const Offset(1, 0),
          end: Offset.zero,
        ).animate(anim),
        child: FadeTransition(opacity: anim, child: child),
      );
    },
  );
}

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      heroTag: icon.toString(),
      child: Container(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            gradient: LinearGradient(
              begin: FractionalOffset(1, 0),
              end: FractionalOffset(0, 1),
              colors: [
                Color(0xFF94DCBE),
                Color(0xFF17C171),
              ],
            ),
          ),
          child: Icon(icon)),
    );
  }
}
