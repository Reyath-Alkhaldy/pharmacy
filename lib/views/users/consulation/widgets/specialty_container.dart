import 'package:flutter/material.dart';
import 'package:new_maps/controller/user/consulation/specialty_controller.dart';

class SpecialtyContainer extends StatelessWidget {
  const SpecialtyContainer(
      {super.key, required this.specialtyController, required this.index});

  final SpecialtyControllerImp specialtyController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        specialtyController
            .goToDoctorsScreen(specialtyController.specialties[index]);
      },
      child: Card(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                specialtyController.specialties[index].imageUrl,
                height: 50,
              ),
              Text(specialtyController.specialties[index].name)
            ],
          ),
        ),
      ),
    );
  }
}
