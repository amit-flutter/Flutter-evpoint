import 'package:evpoint/utils/imports.dart';

//Base Color
const Color kPrimaryColor = Color(0xFF26B96A);
const Color kSecondaryColor = Color(0xFFE6F8EE);
const Color kScaffoldBackgroundColor = Color(0xFFFEFEFE);

//App Theme Color
const Color kPrimaryTextColor = Color(0xFF07122A);
const Color kSecondaryTextColor = Color(0xFF9DA0A8);
const Color kThirdTextColor = Color(0xFFFEFEFE);
const Color kFourthTextColor = Color(0xFF26B96A);
const Color kFifthTextColor = Color(0xFFFAFAFA);

ThemeData kLightTheme = ThemeData(
  primarySwatch: Colors.green,
  scaffoldBackgroundColor: kScaffoldBackgroundColor,
  dividerColor: kSecondaryTextColor.withOpacity(0.7),
  brightness: Brightness.light,
  iconTheme: const IconThemeData(color: kPrimaryColor),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: kScaffoldBackgroundColor,
    selectedItemColor: kPrimaryColor,
    unselectedItemColor: kSecondaryTextColor,
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(kScaffoldBackgroundColor),
    fillColor: MaterialStateProperty.all(kPrimaryColor),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: kScaffoldBackgroundColor,
    iconTheme: IconThemeData(color: kPrimaryTextColor),
    centerTitle: true,
  ),
  textTheme: const TextTheme(
    bodyMedium: StyleConst.kDefaultTextStyle,
    headlineMedium: TextStyle(color: kPrimaryTextColor, fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(color: kPrimaryTextColor, fontWeight: FontWeight.bold),
    labelLarge: TextStyle(color: kPrimaryTextColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(15),
      shadowColor: MaterialStateProperty.all(kPrimaryColor.withOpacity(0.2)),
      backgroundColor: MaterialStateProperty.all(kSecondaryColor),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: kPrimaryColor,
    contentPadding: const EdgeInsets.only(top: 14),
    labelStyle: StyleConst.kDefaultTextStyle,
    suffixIconColor: kPrimaryColor,
    border: StyleConst.underLineBorderStyle,
    enabledBorder: StyleConst.underLineBorderStyle,
    errorBorder: StyleConst.underLineBorderStyle.copyWith(
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    focusedBorder: StyleConst.underLineBorderStyle.copyWith(
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
  floatingActionButtonTheme: FloatingActionButtonThemeData(),
);

///Dark Colors
const Color kDarkPrimaryColor = Color(0xFF07122A);
const Color kDarkSecondaryColor = Color(0xDD404148);
const Color kDarkScaffoldBackgroundColor = Color(0xFF181A21);

//App Theme Color
const Color kDarkPrimaryTextColor = Color(0xFFFFFFFF);
const Color kDarkSecondaryTextColor = Color(0xFF9DA0A8);
const Color kDarkThirdTextColor = Color(0xFFFFFFFF);
const Color kDarkFourthTextColor = Color(0xFF1C1F27);

ThemeData kDarkTheme = ThemeData(
  primarySwatch: Colors.green,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: kDarkPrimaryColor,
    onPrimary: kPrimaryColor,
    secondary: kSecondaryColor,
    onSecondary: kSecondaryColor,
    background: kScaffoldBackgroundColor,
    onBackground: kScaffoldBackgroundColor,
    error: Colors.red,
    onError: Colors.red,
    surface: kDarkSecondaryTextColor,
    onSurface: kDarkSecondaryTextColor,
  ),
  scaffoldBackgroundColor: kDarkScaffoldBackgroundColor,
  brightness: Brightness.dark,
  dividerColor: kDarkSecondaryTextColor,
  iconTheme: const IconThemeData(color: kDarkScaffoldBackgroundColor),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: kDarkScaffoldBackgroundColor,
    selectedItemColor: kPrimaryColor,
    unselectedItemColor: kSecondaryTextColor,
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(kDarkScaffoldBackgroundColor),
    fillColor: MaterialStateProperty.all(kPrimaryColor),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: kDarkScaffoldBackgroundColor,
    iconTheme: IconThemeData(color: kDarkPrimaryTextColor),
  ),
  textTheme: const TextTheme(
    bodyMedium: StyleConst.kDefaultTextStyle,
    headlineMedium: TextStyle(color: kDarkPrimaryTextColor, fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(color: kDarkPrimaryTextColor, fontWeight: FontWeight.bold),
    labelLarge: TextStyle(color: kDarkPrimaryTextColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(15),
      shadowColor: MaterialStateProperty.all(kPrimaryColor.withOpacity(0.2)),
      backgroundColor: MaterialStateProperty.all(kDarkSecondaryColor),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: kPrimaryColor,
    contentPadding: const EdgeInsets.only(top: 14),
    labelStyle: StyleConst.kDefaultTextStyle,
    suffixIconColor: kPrimaryColor,
    border: StyleConst.underLineBorderStyle,
    enabledBorder: StyleConst.underLineBorderStyle,
    errorBorder: StyleConst.underLineBorderStyle.copyWith(
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    focusedBorder: StyleConst.underLineBorderStyle.copyWith(
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
