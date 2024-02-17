// ignore: file_names
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/auth/forgot_password_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/functions/validinput.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/Auth/widget/background_auth.dart';
import 'package:new_maps/views/users/widget/custom_text_form_field_auth.dart';
import 'widget/auth_title_container.dart';
import 'widget/custom_button.dart';

class ForgotPasswordDoctorScreen extends StatelessWidget {
  const ForgotPasswordDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordControllerImp());

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
                      title: 'إعادة تعيين كلمة السر'.tr,
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
                                key: controller.formstate,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(AppImageIcon.imageIconLogo,
                                        height: 100),
                                    CustomTextFormFieldAuth(
                                      validator: (val) {
                                        return validInput(
                                            val!, 6, 100, "email");
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      controller: controller.emailController,
                                      label: 'البريد الإلكتروني',
                                      imageIcon: AppImageIcon.email,
                                    ),
                                    const Gap(20),
                                    CustomButton(
                                      content: 'تحقق'.tr,
                                      onPressed: () async {
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
