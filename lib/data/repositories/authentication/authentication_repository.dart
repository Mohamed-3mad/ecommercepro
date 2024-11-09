import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fruitmarket/data/repositories/user/user_repository.dart';
import 'package:fruitmarket/features/authentication/screens/login/login.dart';
import 'package:fruitmarket/features/authentication/screens/onboarding/onboarding.dart';
import 'package:fruitmarket/features/authentication/screens/signup/verify_email.dart';
import 'package:fruitmarket/navigation_menu.dart';
import 'package:fruitmarket/utils/exceptions/firebase_auth_exception.dart';
import 'package:fruitmarket/utils/exceptions/firebase_exceptions.dart';
import 'package:fruitmarket/utils/exceptions/format_exceptions.dart';
import 'package:fruitmarket/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //---- variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //Get Authenticated user data
  User? get authUser => _auth.currentUser;

  //--  Called from main.dart on app launch
  @override
  void onReady() {
    //FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show Relevant Screen
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull("IsFirstTime", true);

      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnboardingScreen());
    }
  }

  //----------------------------- Email  & Password Sign in --------------------------

  //Login

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatExceptions();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Email Authentication - Register

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatExceptions();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

// Signup with Google
// In AuthenticationRepository
  Future<UserCredential?> signupWithGoogle() async {
    try {
      // Trigger the Google sign-in flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the authentication details
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create a new credential with the obtained tokens
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in with the credential and get the user credential
      final UserCredential userCredential =
          await _auth.signInWithCredential(credentials);

      // Optionally, save user details in Firestore after registration
      // You can create a new user document in Firestore here if needed

      return userCredential; // Return the user credentials after sign-up
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatExceptions();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print("Something went wrong: $e");
      return null;
    }
  }

  Future<void> sendEmailVerification() async {
    try {

      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw 'FirebaseAuthException: ${e.message ?? 'Unknown error'}';
    } on FirebaseException catch (e) {
      throw 'FirebaseException: ${e.message ?? 'Unknown error'}';
    } on FormatException catch (_) {
      throw 'Invalid format exception';
    } on TPlatformException catch (e) {
      throw 'Platform error: ${e.message}';
    } catch (e) {
      throw 'Something went wrong. Please try again: $e';
    }
  }

// Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatExceptions();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Google Authentication

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatExceptions();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print("Something went wrong: $e");
      return null;
    }
  }

  // Re-Authenticate
  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      // create credentials
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatExceptions();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print("Something went wrong: $e");
    }
  }

  // delete Account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatExceptions();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print("Something went wrong: $e");
    }
  }

  // LogOut
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatExceptions();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again.";
    }
  }
}
