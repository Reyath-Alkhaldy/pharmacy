import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/doctor/auth/signup_doctor_controller.dart';
import 'package:new_maps/controller/user/consulation/doctor/specialty_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/functions/validinput.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/Auth/widget/background_auth.dart';
import 'package:new_maps/views/users/Auth/widget/custom_button.dart';
import 'package:new_maps/views/users/widget/custom_text_form_field_auth.dart';
import 'package:new_maps/views/users/widget/textsignup.dart';
import 'widget/auth_title_container.dart';
import 'widget/dropdown_signup.dart';

class SignUpDoctorScreen extends StatelessWidget {
  const SignUpDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpDoctorControllerImp());
    Get.lazyPut(() => SpecialtyControllerImp());
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
                      title: 'أنشاء حساب جديد كطبيب'.tr,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: TColors.white,
                        ),
                        child: GetBuilder<SignUpDoctorControllerImp>(
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
                                    const DropDownSignUp(),

                                    CustomTextFormFieldAuth(
                                      validator: (val) {
                                        return validInput(
                                            val!, 2, 100, "username");
                                      },
                                      controller: controller.nameController,
                                      label: 'الأسم',
                                      imageIcon: AppImageIcon.user,
                                    ),
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
                                    CustomTextFormFieldAuth(
                                      validator: (val) {
                                        return validInput(
                                            val!, 3, 30, "address");
                                      },
                                      controller: controller.addressController,
                                      label: 'العنوان',
                                      imageIcon: AppImageIcon.location,
                                    ),
                                    GetBuilder<SignUpDoctorControllerImp>(
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
                                    // GetBuilder<SignUpDoctorControllerImp>(
                                    //     builder: (_) {
                                    //   return CustomTextFormFieldAuth(
                                    //       validator: (val) {
                                    //         return validInput(
                                    //             val!, 5, 30, "password");
                                    //       },
                                    //       controller:
                                    //           _.confirmPasswordController,
                                    //       label: 'تأكيد كلمة المرور',
                                    //       obscureText: _.isShowPasswordConfirm,
                                    //       suffixIcon: InkWell(
                                    //         onTap: () {
                                    //           _.showPasswordConfirm();
                                    //         },
                                    //         child: _.isShowPasswordConfirm
                                    //             ? const Icon(
                                    //                 Icons.visibility_off)
                                    //             : const Icon(Icons.visibility),
                                    //       ),
                                    //       imageIcon: AppImageIcon.passowrd);
                                    // }),
                                    CustomButton(
                                        content: 'إنشاء حساب'.tr,
                                        onPressed: () async {
                                          await controller.signUp();
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
