import 'package:cached_network_image/cached_network_image.dart';
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
              CachedNetworkImage(
                height: 70,
                imageUrl: specialtyController.specialties[index].imageUrl,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: imageProvider)),
                  );
                },
                placeholder: (context, url) {
                  return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                },
              ),
              Text(specialtyController.specialties[index].name)
            ],
          ),
        ),
      ),
    );
  }
}
