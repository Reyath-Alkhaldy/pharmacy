import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/doctor/auth/reset_password_doctor_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/functions/validinput.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/Auth/widget/background_auth.dart';
import 'package:new_maps/views/users/widget/custom_text_form_field_auth.dart';
import 'package:new_maps/views/users/widget/textsignup.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pinput/pinput.dart';
import 'widget/auth_title_container.dart';
import 'widget/custom_button.dart';

class ResetPasswordDoctorScreen extends StatelessWidget {
  const ResetPasswordDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordDoctorControllerImp());

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
                    AuthTitleDoctorWidget(
                      title: 'تعين كلمة السر الجديدة'.tr,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: TColors.white,
                        ),
                        child: Obx(() => HandlingDataRequest(
                              statusRequest: controller.statusRequest.value,
                              widget: Form(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(AppImageIcon.imageIconLogo,
                                        height: 100),
                                    const Text(
                                        "إدخل الرمز المرسل إلى بريدك لتحقق",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    const Gap(10),
                                    Text(controller.email,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    const Gap(10),
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: OtpTextField(
                                        decoration: const InputDecoration(
                                            hintTextDirection:
                                                TextDirection.ltr),
                                        borderRadius: BorderRadius.circular(20),
                                        numberOfFields: 6,
                                        borderColor: const Color(0xFF512DA8),
                                        //set to true to show as box or false to show as dash
                                        showFieldAsBox: true,
                                        //runs when a code is typed in
                                        onCodeChanged: (String code) {
                                          //handle validation or checks here
                                        },

                                        //runs when every textfield is filled
                                        onSubmit: (String verificationCode) {
                                          controller.otpController
                                              .setText(verificationCode);
                                        }, // end onSubmit
                                      ),
                                    ),
                                    GetBuilder<ResetPasswordDoctorControllerImp>(
                                        builder: (_) {
                                      return CustomTextFormFieldAuth(
                                          validator: (val) {
                                            return validInput(
                                                val!, 5, 30, "password");
                                          },
                                          controller: _.passwordController,
                                          label: 'كلمة السر',
                                          obscureText: _.isShowPassword,
                                          suffixIcon: InkWell(
                                            onTap: () {
                                              _.showPassword();
                                            },
                                            child: _.isShowPassword
                                                ? const Icon(
                                                    Icons.visibility_off)
                                                : const Icon(Icons.visibility),
                                          ),
                                          imageIcon: AppImageIcon.passowrd);
                                    }),
                                    GetBuilder<ResetPasswordDoctorControllerImp>(
                                        builder: (_) {
                                      return CustomTextFormFieldAuth(
                                          validator: (val) {
                                            return validInput(
                                                val!, 5, 30, "password");
                                          },
                                          controller:
                                              _.confirmPasswordController,
                                          label: 'تأكيد كلمة المرور',
                                          obscureText: _.isShowPasswordConfirm,
                                          suffixIcon: InkWell(
                                            onTap: () {
                                              _.showPasswordConfirm();
                                            },
                                            child: _.isShowPasswordConfirm
                                                ? const Icon(
                                                    Icons.visibility_off)
                                                : const Icon(Icons.visibility),
                                          ),
                                          imageIcon: AppImageIcon.passowrd);
                                    }),
                                    CustomButton(
                                      content: 'إرسال'.tr,
                                      onPressed: () async {
                                        await controller.resetPassword();
                                      },
                                    ),
                                    const Gap(20),
                                    CustomTextSignUpOrSignIn(
                                      textone: 'إعادة إرسال الكود',
                                      texttwo: 'إرسال',
                                      onTap: () async {
                                        await controller.fortgotPassword();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ))),
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
