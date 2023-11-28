import 'package:get/get.dart';
import 'package:new_maps/controller/repository/medicines_data.dart';
import 'package:new_maps/core/constant/routes.dart';
import 'package:new_maps/data/models/medicine.dart';

abstract class MedicinesController extends GetxController {
  goToMedicineDetails(Medicine medicine);
}

class MedicinesControllerImp extends MedicinesController {
  late List<Medicine> medicines;
  @override
  void onInit() {
    medicines = medicinesData;
    super.onInit();
  }

  @override
  goToMedicineDetails(Medicine medicine) {
    Get.toNamed(AppRoute.medicineDetails, arguments: {
      'medicine': medicine,
    });
  }

 
}
