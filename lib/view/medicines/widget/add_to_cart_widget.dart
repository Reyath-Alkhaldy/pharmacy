import 'package:flutter/material.dart';
import 'package:new_maps/controller/medicine_details_controller.dart';
import 'package:new_maps/controller/medicines_controller.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({
    super.key,
    required this.controllerImp,
  });
  final MedicineDetailsControllerImp controllerImp;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                controllerImp.goToSignIn();
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'Add to Cart',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  // boxShadow: const [
                  //   BoxShadow(
                  //     blurRadius: 0.2,
                  //     // color: Colors.black,
                  //     offset: Offset(2, 2),
                  //   ),
                  // ],
                  // color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    icon: Icons.remove,
                    size: 20,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  Text(
                    '1',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  CustomIconButton(
                    icon: Icons.add,
                    size: 20,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    this.color,
    this.onPressed,
    required this.size,
  }) : super(key: key);
  final IconData icon;
  final Color? color;
  final VoidCallback? onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        weight: 20,
        color: color,
        size: size,
      ),
    );
  }
}
