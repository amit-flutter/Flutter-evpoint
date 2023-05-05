import 'package:evpoint/utils/imports.dart';

class StyleConst {
  static const TextStyle kDefaultTextStyle = TextStyle(
    fontSize: 22,
    color: kPrimaryColor,
    fontFamily: 'RobotoMono',
  );

  static UnderlineInputBorder underLineBorderStyle =
      UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryColor.withOpacity(0.5), width: 2));

  static OutlineInputBorder outlineNoBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide.none,
  );
}
