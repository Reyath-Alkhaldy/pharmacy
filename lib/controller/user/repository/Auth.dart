import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:riverpod/riverpod.dart';

final authProvider = Provider<Auth>((ref) => Auth());

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;
  late final String verificationId;
  late final int? resendToken;

  Future<void> authenticate({required String phoneNumber}) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (kDebugMode) {
          print('FirebaseAuthException nnnn $e');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        if (kDebugMode) {
          print('verificationId verificationId verificationId$verificationId and resendToken $resendToken');
        }
        this.verificationId = verificationId;
        this.resendToken = resendToken;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        if (kDebugMode) {
          print('verificationId verificationId verificationId $verificationId');
        }
      },
    );
  }

  Future<void> verifyFromPhoneNumber(
      {required String verificationId, required String smsCode}) async {
// await auth.verifyPhoneNumber(
//   phoneNumber: '+44 7123 123 456',
//   codeSent: (String verificationId, int? resendToken) async {
    // Update the UI - wait for the user to enter the SMS code
    // String smsCode = 'xxxx';

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential);
//   },
// );
  }
}
