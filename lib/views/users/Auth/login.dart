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
import 'sign_up.dart';
import 'widget/simple_drop_down.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginControllerImp());

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
                child: Obx(
                  () => HandlingDataRequest(
                    statusRequest: loginController.statusRequest.value,
                    widget: Form(
                      key: loginController.formstate,
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
                                //! Simple DropDown
                                SimpleDropdown(),
                                CustomTextFormFieldAuth(
                                    keyboardType: TextInputType.phone,
                                    validator: (val) {
                                      return validInput(val!, 5, 100, "phone");
                                    },
                                    controller:
                                        loginController.phoneNumberController,
                                    label: 'رقم الهاتف',
                                    imageIcon: AppImageIcon.smartPhone),
                                GetBuilder<LoginControllerImp>(builder: (_) {
                                  return CustomTextFormFieldAuth(
                                    validator: (val) {
                                      return validInput(
                                          val!, 3, 30, "password");
                                    },
                                    controller: _.passwordController,
                                    label: 'كلمة السر',
                                    obscureText: _.isshowpassword,
                                    suffixIcon: InkWell(
                                      onTap: _.showPassword(),
                                      child: _.isshowpassword
                                          ? const Icon(
                                              Icons.visibility,
                                            )
                                          : const Icon(
                                              Icons.visibility_off,
                                            ),
                                    ),
                                    imageIcon: AppImageIcon.passowrd,
                                  );
                                }),
                                CustomButton(
                                  content: 'تسحيل الدخول'.tr,
                                  onPressed: () async {
                                    await loginController.login();
                                  },
                                ),
                                CustomTextSignUpOrSignIn(
                                  textone: "ليس لديك حساب ؟ ",
                                  texttwo: 'إنشاء حساب',
                                  onTap: () {
                                    loginController.goToSignUp();
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
            ),
          ),
        ],
      ),
    );
  }
}
