import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/doctor/auth/signup_doctor_controller.dart';
import 'package:new_maps/controller/user/consulation/doctor/specialty_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';

class DropDownSignUp extends StatelessWidget {
  const DropDownSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final specialtyController = Get.put(SpecialtyControllerImp());
    final controller = Get.put(SignUpDoctorControllerImp());
    return Obx(
      () => HandlingDataView(
        statusRequest: specialtyController.statusRequest.value,
        widget: GetBuilder<SignUpDoctorControllerImp>(
          builder: (_) {
            return DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: const Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        'إختار تخصصك',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: TColors.secondary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: specialtyController.specialties
                    .map((item) => DropdownMenuItem<String>(
                          value: item.id.toString(),
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: controller.specialtyIdController.text.isNotEmpty
                    ? controller.specialtyIdController.text
                    : null,
                onChanged: (value) {
                  controller.setSpecialtyId(value!.toString());
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: 360,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: TColors.primary,
                  ),
                  elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.yellow,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: TColors.primary,
                  ),
                  offset: const Offset(-20, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
