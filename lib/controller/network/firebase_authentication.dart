import 'package:evpoint/utils/imports.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthController extends GetxController {
  static FirebaseAuthController instance = Get.find();

  //Variable
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  //Setting initial screen onLoad.
  _setInitialScreen(User? user) {
    user == null ? Get.offAllNamed(RouteConst.kLogin) : Get.offAllNamed(RouteConst.kHome);
  }

  //1.1 Phone Number Auth
  void phoneAuthentication(String phoneNumber, String routeName) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
        var data = {"routeFrom": routeName, "message": phoneNumber};
        Get.toNamed(RouteConst.kOtpVerification, parameters: data);
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        Logger.logPrint(title: "ERROR",body: e.code.toString());
        e.code == "invalid-phone-number"
            ? Get.snackbar("Error", "Invalid Phone Number")
            : Get.snackbar("Error", "${e.message}");
      },
    );
  }

  //1.2 OTP Verification
  Future<bool> verifyOTP(String otp) async {
    var credential = await _auth
        .signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));
    return credential.user != null ? true : false;
  }

  //Email-Password Auth
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Logger.logPrint(title: e.toString());
      if (e.code == "email-already-in-use") {
        loginUserWithEmailAndPassword(email, password);
      }
    } catch (_) {}
  }

  //Email-Password Login
  Future<void> loginUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Logger.logPrint(title: e.toString());
    } catch (_) {}
  }

  //Firebase Logout
  Future<void> logout() => _auth.signOut();

  socialLogin(String socialName) {
    switch (socialName) {
      case StringsConst.kTextGoogle:
        FirebaseAuthController.instance.googleLogin();
        break;
      case StringsConst.kTextApple:
        FirebaseAuthController.instance.appleLogin();
        break;
      case StringsConst.kTextFacebook:
        FirebaseAuthController.instance.appleLogin();
        break;
    }
  }

  ///Google Login
  void googleLogin() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  ///Apple Login
  void appleLogin() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  ///Facebook Login
  void facebookLogin() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
