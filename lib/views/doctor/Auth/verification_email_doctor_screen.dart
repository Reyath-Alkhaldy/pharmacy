import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/doctor/auth/verification_email_doctor_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/Auth/widget/background_auth.dart';
import 'package:new_maps/views/users/widget/textsignup.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'widget/auth_title_container.dart';

class VerificationEmailDoctorScreen extends StatelessWidget {
  const VerificationEmailDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerificationEmailDoctorControllerImp());

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
                      title: 'التحقق من البريد الإلكتروني'.tr,
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
                              widget: Column(
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
                                  Text(controller.doctorResponse.doctor.email,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const Gap(10),
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: OtpTextField(
                                      decoration: const InputDecoration(
                                          hintTextDirection: TextDirection.ltr),
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
                                        controller.verificationEmail(
                                            verificationCode);
                                      }, // end onSubmit
                                    ),
                                  ),
                                  const Gap(20),
                                  CustomTextSignUpOrSignIn(
                                    textone: 'إعادة إرسال الكود',
                                    texttwo: 'إرسال',
                                    onTap: () {
                                      controller.sendEmailVerification();
                                    },
                                  ),
                                ],
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
