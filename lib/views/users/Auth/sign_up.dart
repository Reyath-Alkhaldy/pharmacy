import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/auth/signup_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/functions/validinput.dart';
import 'package:new_maps/core/utils/constant/app_image_icon.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/views/users/Auth/widget/background_auth.dart';
import 'package:new_maps/views/users/Auth/widget/custom_button.dart';
import 'package:new_maps/views/users/Auth/widget/simple_drop_down.dart';
import 'package:new_maps/views/users/widget/custom_text_form_field_auth.dart';
import 'package:new_maps/views/users/widget/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpControllerImp());
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
                      child: Obx(
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
                                //! Simple DropDown
                                SimpleDropdown(controller: controller),
                                CustomTextFormFieldAuth(
                                  validator: (val) {
                                    return validInput(val!, 2, 100, "username");
                                  },
                                  controller: controller.nameController,
                                  label: 'الأسم',
                                  imageIcon: AppImageIcon.user,
                                ),
                                if (controller.userType.value != 1)
                                  CustomTextFormFieldAuth(
                                    validator: (val) {
                                      return validInput(val!, 6, 100, "email");
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    controller: controller.emailController,
                                    label: 'البريد الإلكتروني',
                                    imageIcon: AppImageIcon.email,
                                  ),
                                CustomTextFormFieldAuth(
                                    keyboardType: TextInputType.phone,
                                    validator: (val) {
                                      return validInput(val!, 5, 100, "phone");
                                    },
                                    controller:
                                        controller.phoneNumberController,
                                    label: 'رقم الهاتف',
                                    imageIcon: AppImageIcon.smartPhone),

                                if (controller.userType.value == 3)
                                  CustomTextFormFieldAuth(
                                    validator: (val) {
                                      return validInput(
                                          val!, 3, 30, "password");
                                    },
                                    controller: controller.addressController,
                                    label: 'العنوان',
                                    imageIcon: AppImageIcon.location,
                                  ),
                                GetBuilder<SignUpControllerImp>(builder: (_) {
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
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off),
                                      ),
                                      imageIcon: AppImageIcon.passowrd);
                                }),
                                GetBuilder<SignUpControllerImp>(builder: (_) {
                                  return CustomTextFormFieldAuth(
                                      validator: (val) {
                                        return validInput(
                                            val!, 5, 30, "password");
                                      },
                                      controller: _.confirmPasswordController,
                                      label: 'تأكيد كلمة المرور',
                                      obscureText: _.isShowPasswordConfirm,
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          _.showPasswordConfirm();
                                        },
                                        child: _.isShowPasswordConfirm
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off),
                                      ),
                                      imageIcon: AppImageIcon.passowrd);
                                }),

                                CustomButton(
                                    content: 'إنشاء حساب'.tr,
                                    onPressed: ()async {
                                   await   controller.signUp();
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
                      ),
                    ),
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
