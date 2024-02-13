import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/cart/cart_controller.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/checkout/widgets/confirm_or_back_widget.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartControllerImp cartController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: TColors.primary,
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const ImageIcon(
                AssetImage(AppImageIcon.arrow),
                color: TColors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DataTable(
              columnSpacing: 20,
              columns: const [
                DataColumn(label: Text('الاسم')),
                DataColumn(label: Text('السعر')),
                DataColumn(label: Text('الكمية')),
                DataColumn(label: Text('الإجمالي')),
              ],
              rows: cartController.carts
                  .map((cart) => DataRow(cells: [
                        DataCell(Text(cart.medicine.nameEn)),
                        DataCell(Text(cart.medicine.price.toStringAsFixed(2))),
                        DataCell(Text(cart.quantity.toString())),
                        DataCell(Text((cart.medicine.price * cart.quantity)
                            .toStringAsFixed(2))),
                      ]))
                  .toList(),
            ),
            const Divider(),
            const Divider(color: TColors.primary),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('المجموع'),
                Text(cartController.total.toStringAsFixed(2)),
              ],
            ),
            const Divider(color: TColors.primary),
            const ConfirmOrBackWidget()
          ],
        ),
      ),
    );
  }
}

// class CarttController extends GetxController {
//   var products = <Product>[].obs;

//   void addProduct(Product product) {
//     products.add(product);
//   }

//   int calculateTotal() {
//     int total = 0;
//     for (var product in products) {
//       total += product.price * product.quantity;
//     }
//     return total;
//   }
// }

// class Product {
//   final String name;
//   final int price;
//   int quantity;

//     Product({required this.name, required this.price, this.quantity = 1});
// }
