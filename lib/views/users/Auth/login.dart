import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/auth/login_controller.dart';
import 'package:new_maps/core/utils/constant/app_image_icon.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/views/users/Auth/widget/background_auth.dart';
import 'package:new_maps/views/users/Auth/widget/custom_button.dart';
import 'package:new_maps/views/users/widget/custom_text_form_field_auth.dart';
import 'package:new_maps/views/users/widget/textsignup.dart';

import 'sign_up.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginControllerImp());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundAuth(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: size.height,
            child: Center(
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AuthTitleWidget(
                        title: 'تسجيل الدخول'.tr,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: TColors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(AppImageIcon.imageIconLogo,
                                height: 100),
                            const CustomTextFormFieldAuth(
                                label: 'رقم الهاتف',
                                imageIcon: AppImageIcon.smartPhone),
                            const CustomTextFormFieldAuth(
                              label: 'كلمة السر',
                              obscureText: true,
                              imageIcon: AppImageIcon.smartPhone,
                            ),
                            CustomButton(
                              content: 'تسحيل الدخول'.tr,
                              onPressed: () {
                                controller.goToPharmacyScreen();
                              },
                            ),
                            CustomTextSignUpOrSignIn(
                              textone: "ليس لديك حساب ؟ ",
                              texttwo: 'إنشاء حساب',
                              onTap: () {
                                controller.goToSignUp();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
