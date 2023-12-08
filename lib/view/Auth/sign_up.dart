import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/auth/signup_controller.dart';
import 'package:new_maps/core/utils/constant/app_image_icon.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/view/Auth/widget/background_auth.dart';
import 'package:new_maps/view/Auth/widget/custom_button.dart';
import 'package:new_maps/view/widget/custom_text_form_field_auth.dart';
import 'package:new_maps/view/widget/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpControllerImp());
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
                        title: 'حساب جديد'.tr,
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
                              label: 'الأسم',
                              imageIcon: AppImageIcon.user,
                            ),
                            const CustomTextFormFieldAuth(
                                label: 'رقم الهاتف',
                                imageIcon: AppImageIcon.smartPhone),
                            const CustomTextFormFieldAuth(
                              label: 'كلمة المرور',
                              obscureText: true,
                              imageIcon: AppImageIcon.passowrd,
                            ),
                            const CustomTextFormFieldAuth(
                              label: 'تأكيد كلمة المرور',
                              obscureText: true,
                              imageIcon: AppImageIcon.passowrd,
                            ),
                            CustomButton(
                                content: 'إنشاء حساب'.tr,
                                onPressed: () {
                                  controller.goToPharmacyScreen();
                                }),
                            CustomTextSignUpOrSignIn(
                              textone: "تملك حساب ",
                              texttwo: 'تسجيل الدخول',
                              onTap: () {
                                controller.goToLogin();
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

class AuthTitleWidget extends StatelessWidget {
  const AuthTitleWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: const BoxDecoration(
        color: TColors.primary,
        // borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: TColors.white),
      ),
    );
  }
}
