import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/pharmacies/categories_pharmacy_controller.dart';
import 'package:new_maps/core/class/crud.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/data/database/remote/pharmacy_data.dart';

import '../../data/models/MedicalSpecialty.dart';

abstract class MedicalSpecialtiesController extends GetxController {
  getMedicalSpecialties();
  goToConsulationScreen(MedicalSpecialty medicalSpecialty);
}

class MedicalSpecialtiesControllerImp extends MedicalSpecialtiesController {
  PharmacyData pharmacyData = PharmacyData(Get.find<Crud>());
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final pharmacies = <MedicalSpecialty>[].obs;
  late CategoriesPharmacyControllerImp categoriesPharmacyControllerImp;
  @override
  void onInit() {
    super.onInit();
    getMedicalSpecialties();
    if (kDebugMode) {
      print('response. init');
    }
  }

  @override
  getMedicalSpecialties() async {
    try {
      statusRequest.value = StatusRequest.loading;
      final response = await pharmacyData.getPharmacies("pharmacies", {});
      if (kDebugMode) {
        print(response);
        print('response.data');
      }
      statusRequest.value = handlingData(response);
      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          pharmacies.value = List<MedicalSpecialty>.from(
            (response['data']).map<MedicalSpecialty>(
              (x) => MedicalSpecialty.fromMap(x as Map<String, dynamic>),
            ),
          );
          update();
        } else {
          statusRequest.value == StatusRequest.failure;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("هناك خطأ  ");
      }
      e.printError();
    }
  }

  @override
  goToConsulationScreen(MedicalSpecialty medicalSpecialty) {
   
    Get.toNamed(
      AppRoute.consulationScreen,arguments: {'medicalSpecialty': medicalSpecialty}
    );
  }
}
