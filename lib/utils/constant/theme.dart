import 'package:evpoint/utils/imports.dart';

//Base Color
const Color kPrimaryColor = Color(0xFF07122A);
const Color kScaffoldBackgroundColor = Color(0xFFFEFEFE);

//App Theme Color
const Color kPrimaryTextColor = Color(0xFF07122A);
const Color kSecondaryTextColor = Color(0xFF9DA0A8);
const Color kThirdTextColor = Color(0xFFFFFFFF);


ThemeData kLightTheme = ThemeData(
  // useMaterial3: true,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: kScaffoldBackgroundColor,
  textTheme: const TextTheme(
    bodyMedium: StyleConst.kDefaultTextStyle,
  ),

  inputDecorationTheme: InputDecorationTheme(
    alignLabelWithHint: true,
    focusColor: kPrimaryColor,
    contentPadding: const EdgeInsets.only(left: 20),
    labelStyle: StyleConst.kDefaultTextStyle,
    suffixIconColor: kPrimaryColor,
    border: StyleConst.outLineBorderStyle,
    enabledBorder: StyleConst.outLineBorderStyle,
    errorBorder: StyleConst.outLineBorderStyle.copyWith(
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    focusedBorder: StyleConst.outLineBorderStyle.copyWith(
      borderSide: const BorderSide(color: kPrimaryColor, width: 2),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      textStyle: StyleConst.kDefaultTextStyle,
    ),
  ),

  textSelectionTheme: TextSelectionThemeData(
    cursorColor: kPrimaryColor,
    selectionColor: kPrimaryColor.withOpacity(0.3),
  ),
);

ThemeData kDarkTheme = ThemeData(
  primarySwatch: Colors.blue,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 21,
      color: Colors.green,
      fontFamily: 'dancingScript',
    ),
    bodyMedium: TextStyle(
      fontFamily: 'RobotoMono',
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
);
