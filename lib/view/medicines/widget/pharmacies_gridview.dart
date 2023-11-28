
import 'package:flutter/material.dart';
import 'package:new_maps/controller/repository/pharmacies_data.dart';
import 'package:new_maps/view/pharmacy/widget/phparmacy_container.dart';

class PharmaciesGridView extends StatelessWidget {
  const PharmaciesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: phparmaciesData.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return PharmacyContainer(pharmacy: phparmaciesData[index]);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 200,
                crossAxisCount: 2,
                mainAxisSpacing: 25,
                crossAxisSpacing: 16),
          )
        ;
  }
}

