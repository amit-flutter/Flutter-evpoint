import 'package:evpoint/utils/imports.dart';

class StyleConst {
  static const TextStyle kDefaultTextStyle = TextStyle(
    fontSize: 22,
    color: kPrimaryColor,
    fontFamily: 'RobotoMono',
  );

  static UnderlineInputBorder underLineBorderStyle =
      UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryColor.withOpacity(0.5), width: 2));
}
