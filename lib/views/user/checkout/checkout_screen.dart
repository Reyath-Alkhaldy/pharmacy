// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/checkout/checkout_controller.dart';
import '../../../core/utils/constant/export_constant.dart';
import '../widget/background_user_view_screen.dart';
import 'widgets/confirm_or_back_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const columns2 = [
      DataColumn(
        label: Text('المنتح'),
      ),
      DataColumn(
        label: Text('ااكمية'),
      ),
      DataColumn(
        label: Text('السعر'),
      ),
      DataColumn(
        label: Text('الإجمالي'),
      ),
    ];
    const rows2 = [
      DataRow(
        cells: [
          DataCell(
            Text('Product'),
          ),
          DataCell(
            Text('2'),
          ),
          DataCell(
            Text('500'),
          ),
          DataCell(
            Text('1000'),
          ),
        ],
      ),
      DataRow(
        cells: [
          DataCell(
            Text('new product'),
          ),
          DataCell(
            Text('3'),
          ),
          DataCell(
            Text('300'),
          ),
          DataCell(
            Text('900'),
          ),
        ],
      ),
      DataRow(
        cells: [
          DataCell(
            Text('old product'),
          ),
          DataCell(
            Text('4'),
          ),
          DataCell(
            Text('200'),
          ),
          DataCell(
            Text('800'),
          ),
        ],
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: TColors.primary,
        title: Text(
          "تأكيد الطلب",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold, fontSize: 15, color: TColors.white),
        ),
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
      backgroundColor: TColors.primary,
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundUserViewScreen(),
            Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Gap(20),
                      Container(
                        decoration: BoxDecoration(
                            color: TColors.lightGrey,
                            borderRadius: BorderRadius.circular(20)),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        margin:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            DataTable(
                              decoration: BoxDecoration(
                                  color: TColors.lightGrey,
                                  borderRadius: BorderRadius.circular(20)),
                              columnSpacing: 30,
                              horizontalMargin: 10,
                              sortColumnIndex: 3,
                              sortAscending: true,
                              columns: columns2,
                              rows: rows2,
                            ),
                            const Gap(5),
                            const PriceTable(),
                          ],
                        ),
                      ),
                      const Gap(10),
                      const TotalPriceTable(),
                      const Gap(10),
                      Column(
                        children: [
                          const Text('طريقة الدفع :'),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              customRaido(
                                  AppImageIcon.cashOnDelivery, 'عند التسليم', 0),
                              customRaido(
                                  AppImageIcon.moneyTransfer, 'عند التسليم', 1),
                            ],
                          ),
                  
                        ],
                      ),
                              
                    ],
                  ),
                ),
                               const ConfirmOrBackWidget(),

              ],
              
            )
          ],
        ),
      ),
    );
  }

  customRaido(String assetName, String text, int index) {
    return GetX<CheckoutContollerImp>(
      init: CheckoutContollerImp(),
      initState: (_) {},
      builder: (controller) {
        return InkWell(
          onTap: () {
            controller.getSelectedIndex(index) ;
          },
          child: Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              border: controller.slctIndex.value == index
                  ? Border.all(color: TColors.primary, width: 3)
                  : null,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageIcon(
                  AssetImage(assetName),
                  color:controller.slctIndex.value == index ? TColors.primary:null,
                  size: TSizes.iconXLg,
                ),
                Text(text),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TotalPriceTable extends StatelessWidget {
  const TotalPriceTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: TColors.lightGrey, borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('الإجمالي: '),
          Text(
            '3700 ريال',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: TColors.secondary),
          ),
        ],
      ),
    );
  }
}

class PriceTable extends StatelessWidget {
  const PriceTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('سعر المنتجات'),
            Text('سعر التوصيل'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('2700'),
            Text('1000'),
          ],
        ),
      ],
    );
  }
}
