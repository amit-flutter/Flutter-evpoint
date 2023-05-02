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

class CustomDialogUI extends StatelessWidget {
  const CustomDialogUI({
    Key? key,
    required this.logoImage,
    required this.title,
    required this.subTitle,
    required this.lastImage,
  }) : super(key: key);

  final String logoImage;
  final String title;
  final String subTitle;
  final String lastImage;

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
      ],
    );
  }
}

void showCustomDialog({required BuildContext context, required Widget customDialogUI}) {
  showGeneralDialog(
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
