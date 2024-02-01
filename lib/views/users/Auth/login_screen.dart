import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/auth/login_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/functions/validinput.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/Auth/widget/background_auth.dart';
import 'package:new_maps/views/users/Auth/widget/custom_button.dart';
import 'package:new_maps/views/users/widget/custom_text_form_field_auth.dart';
import 'package:new_maps/views/users/widget/textsignup.dart';
import 'widget/auth_title_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginControllerImp());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundAuth(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: size.height,
            child: Center(
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
                        child: GetBuilder<LoginControllerImp>(
                            builder: (controller) {
                          return Obx(
                            () => HandlingDataRequest(
                              statusRequest: controller.statusRequest.value,
                              widget: Form(
                                key: controller.formstate,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(AppImageIcon.imageIconLogo,
                                        height: 100),
                                    CustomTextFormFieldAuth(
                                        keyboardType: TextInputType.phone,
                                        validator: (val) {
                                          return validInput(
                                              val!, 5, 100, "phone");
                                        },
                                        controller:
                                            controller.phoneNumberController,
                                        label: 'رقم الهاتف',
                                        imageIcon: AppImageIcon.smartPhone),
                                    GetBuilder<LoginControllerImp>(
                                        builder: (_) {
                                      return CustomTextFormFieldAuth(
                                        validator: (val) {
                                          return validInput(
                                              val!, 3, 30, "password");
                                        },
                                        controller: _.passwordController,
                                        label: 'كلمة السر',
                                        obscureText: _.isshowpassword,
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            _.showPassword();
                                          },
                                          child: _.isshowpassword
                                              ? const Icon(
                                                  Icons.visibility_off,
                                                )
                                              : const Icon(
                                                  Icons.visibility,
                                                ),
                                        ),
                                        imageIcon: AppImageIcon.passowrd,
                                      );
                                    }),
                                    CustomTextSignUpOrSignIn(
                                      textone: " نسيت كلمة السر؟",
                                      texttwo: '‘إعادة تعينن كلة السر',
                                      onTap: () {
                                        controller.goToForgotPasswordScreen();
                                      },
                                    ),
                                    CustomButton(
                                      content: 'تسحيل الدخول'.tr,
                                      onPressed: () async {
                                        await controller.login();
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
                            ),
                          );
                        })),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
