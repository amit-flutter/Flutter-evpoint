import 'package:evpoint/utils/imports.dart';

class StyleConst {
  static const TextStyle kDefaultTextStyle = TextStyle(
    fontSize: 22,
    color: kPrimaryColor,
    fontFamily: 'RobotoMono',
  );

  static OutlineInputBorder outLineBorderStyle = OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor.withOpacity(0.5), width: 2),
    borderRadius: BorderRadius.circular(10),
  );
}
