import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/auth/login_controller.dart';
import 'package:new_maps/view/Auth/widget/custom_button_auth.dart';
import 'package:new_maps/view/widget/custom_text_form_field_auth.dart';
import 'package:new_maps/view/widget/textsignup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginControllerImp());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: size.height,
        child: Center(
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      'Login to your Account'.tr,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const CustomTextFormFieldAuth(label: 'Phone number'),
                  const CustomTextFormFieldAuth(
                    label: 'Password',
                    obscureText: true,
                  ),
                  CustomButtonAuth(
                    content: 'sign in'.tr,
                    onPressed: () {
                      controller.goToPharmacyScreen();
                    },
                  ),
                  CustomTextSignUpOrSignIn(
                    textone: "Don't have any account ? ",
                    texttwo: 'Sign Up',
                    onTap: () {
                      controller.goToSignUp();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
