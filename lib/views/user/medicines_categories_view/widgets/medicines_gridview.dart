import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/data/models/sub_category.dart';
import '../../../../controller/categories/medicines_category_controller.dart';
import 'medicine_container.dart';

class MedicineGridView extends StatelessWidget {
  const MedicineGridView({super.key, this.subCategory});
  final SubCategory? subCategory;

  @override
  Widget build(BuildContext context) {
    
  final MedicinesCategoryControllerImp medicinesCategoryControllerImp =
      Get.put(MedicinesCategoryControllerImp());
    return Obx(() => HandlingDataView(
            statusRequest: medicinesCategoryControllerImp.statusRequest,
            widget: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: medicinesCategoryControllerImp.medicines.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return MedicineContainer(medicine: medicinesCategoryControllerImp.medicines.value[index]);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 170,
                crossAxisCount: 3,
            mainAxisSpacing: 15,
            crossAxisSpacing: 10,
             )   // childAspectRatio: 3.5,

          ),
        ));
    // });
  }
}
