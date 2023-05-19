import 'package:evpoint/utils/imports.dart';

class StringsConst {
  //Images
  static const String kImgAppIcon = 'assets/images/icon.png';
  static const String kImgLogin = 'assets/images/login.png';
  static const String kImgLoginDark = 'assets/images/loginDark.png';
  static const String kAddVehicle = 'assets/images/addVehicle.png';
  static const String kAddVehicleDark = 'assets/images/addVehicleDark.png';
  static const String kDoneBubble = 'assets/images/doneBubble.png';
  static const String kDoneBubbleDark = 'assets/images/doneBubbleDark.png';
  static const String kLoader = 'assets/images/loader.png';

  //Splash Screen
  static const String kTextEvPoint = 'EVPoint';

  //welcome
  static const String kTextSkip = 'Skip';
  static const String kTextNext = 'Next';

  static const List kWelcomeNotes = [
    [
      'Easily find EV charging\nstations around you',
      'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit, sed do eiusmod tempor.',
    ],
    [
      'Fast and simple to make\nreservation & check in',
      'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit, sed do eiusmod tempor.',
    ],
    [
      'Make payments safely &\nquickly with EVPoint',
      'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit, sed do eiusmod tempor.',
    ]
  ];

  //Login
  static const String kTextLetsYouIn = "Let's you in";
  static const String kTextContinue = "Continue with";
  static const String kTextOr = "or";
  static const String kTextSignPhoneNumber = "Sign in with Phone Number";
  static const String kTextDonHaveAccount = "Don't have an account?";
  static const String kTextSignUp = "Sign up";

  //SignUp
  static const String kTextHelloThere = "Hello there 👋";
  static const String kTextSignUpMessage = "Please enter your phone number. You will receive an OTP code in the next "
      "step for the verification process.";
  static const String kTextPhoneNumber = "Phone Number";

  //OTP Code Verification
  static const String kTextOTPCodeVerification = "OTP code verification 🔐";
  static String kTextOTPCodeVerificationMessage(String number) =>
      "We have sent an OTP code to phone number $number. Enter the OTP code below to continue";
  static const String kTextDonTReceiveEmail = "Didn't receive email?";
  static const String kTextResendCode = "You can resend code in ";

  //OTP Code Verification
  static const String kTextCompleteYourProfile = "Complete your profile 📋";
  static const String kTextCompleteYourProfileMessage =
      "Don't worry. only you can see your personal data. No one else will be able to see it.";
  static const String kTextFullName = "Full Name";
  static const String kTextEmail = "Email";
  static const String kTextGender = "Gender";
  static const String kTextDateOfBirth = "Date of Birth";
  static const String kTextDateFormat = "MM/DD/YYYY";

  //Add Vehical
  static const String kTextAddVehicleTitle = "Personalize your\nexperience by adding a\nvehicle 🚘";
  static const String kTextAddVehicleMessage = "Your vehicle is used to determine compatible charging stations";
  static const String kTextAddLater = "Add Later";
  static const String kTextAddVehicle = "Add Vehicle";

  //SignIn
  static const String kTextSignInMessage = "Please enter your phone number. You will receive an OTP code in the next "
      "step to sign in.";
  static const String kTextRememberMe = "Remember me";
  static const String kTextCanTAccessYourPhone = "Can't access your phone number?";
  static const String kTextUserEmailTOSignIn = "User email to sign in";
  static const String kTextOrContinueWith = "or continue with";
  static const String kTextGoogle = "Google";
  static const String kTextApple = "Apple";
  static const String kTextFacebook = "Facebook";

  //Home Screen
  static const String kTextYourCourses = "Your courses";

  //Select Payment
  static const List kSelectPayment = [
    [Icons.credit_card_outlined, "Credit Card"],
    [Icons.currency_bitcoin, "Bit Coins"],
    [Icons.money_rounded, "Debit Card"],
    [Icons.monetization_on_outlined, "UPI"],
    [Icons.payments_outlined, "Cash"],
  ];

  static const List ren = <String>["", ""];

  //Review Summary
  static const List kReviewSummaryDate = [
    [false, "Booking Date", "Dec 17,2024"],
    [false, "Time of Arrival", "10:00 AM"],
    [false, "Charging Duration", "1 Hour"],
  ];

  static const List kReviewSummaryPayment = [
    [false, "Amount Estimation", "\$ 14.25"],
    [true, "Tax", "Free"],
    [false, "Total Amount", "\$ 14.23"],
  ];
}
