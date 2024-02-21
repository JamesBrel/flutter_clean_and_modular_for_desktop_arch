import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../constants/lang_const.dart';
import '../../configs/firebase_instance.dart';
import '../../utils/status_util.dart';

class AuthRequest {
  static Future<Map<String, dynamic>> getSmsCode({
    required Map<String, dynamic> data,
  }) async {
    var _result = <String, dynamic>{};
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: data["phoneNumber"],
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential _phoneAuthCredential) {
        _result = {
          "status": FirebaseStatus.ok,
        };
      },
      verificationFailed: (FirebaseAuthException firebaseAuthException) {
        if (firebaseAuthException.code == "invalid-phone-number") {
          _result = {
            "status": FirebaseStatus.badRequest,
            "message": Lang.verifyErrorText,
          };
        } else {
          _result = {
            "status": FirebaseStatus.notFound,
            "message": Lang.requestErrorTryAgainText,
          };
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        _result = {
          "status": FirebaseStatus.created,
          "data": verificationId,
        };
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _result = {
          "status": FirebaseStatus.timeout,
          "message": Lang.timeErrorText,
        };
      },
    );

    await Future.delayed(
      const Duration(seconds: 5),
    );
    return _result;
  }

  static Future<Map<String, dynamic>> submitSmsCodeToMakeAuthenticate({
    required String smsCode,
    required String verificationId,
  }) async {
    if (Platform.isAndroid) {
      return await firebaseAuth
          .signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      ))
          .then((userCredential) async {
        if (userCredential.user != null) {
          return {
            "status": FirebaseStatus.created,
            "data": userCredential.user!.uid,
          };
        } else {
          return {
            "status": FirebaseStatus.noContent,
            "message": Lang.noContentText,
          };
        }
      });
    } else {
      return {}; // todo :  on reviendra
    }
  }

  // Future<void> logout() async {
  //   await firebaseAuth.signOut();
  // } // todo :  c'est pour après
}
