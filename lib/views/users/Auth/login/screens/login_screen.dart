import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Phone Auth'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              const Expanded(
              flex: 1,
              // margin: EdgeInsets.only(top: 60),
              child: Center(
                child: Text(
                  'Phone Authentication',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              // margin: EdgeInsets.only(top: 40, right: 10, left: 10),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Phone Number',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      '+967',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            ),
            Expanded(
              flex: 1,
              // margin: EdgeInsets.all(10),
              // width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      backgroundColor: Colors.blueAccent),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              // margin: EdgeInsets.all(10),
              // width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: FirebasePhoneAuthHandler(
                  // sendOtpOnInitialize: true,
                  onCodeSent:() {
                    
                  },
                  onLoginSuccess: (userCredential, p1) {
                    if (kDebugMode) {
                      print('user ture or false ${userCredential.user} ');
                    }
                    if (kDebugMode) {
                      print('user credential ${userCredential.user} ');
                    }
                    debugPrint("autoVerified: $p1");
                    debugPrint(
                        "Login success UID: ${userCredential.user?.uid}");
                  },
                  signOutOnSuccessfulVerification: false,

                  linkWithExistingUser: false,
                  
                  onLoginFailed: (authException, stackTrace) {
                    debugPrint("An error occurred: ${authException.message}");
                  },
                  onError: (error, stackTrace) {},
                  phoneNumber: "+967770234262",
                  builder: (context, controller) {
                    // controller.
                    return const Text('data ');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
