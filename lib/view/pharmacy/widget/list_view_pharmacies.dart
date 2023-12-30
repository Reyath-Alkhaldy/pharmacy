import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/pharmacy_controller.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/data/models/pharmacy.dart';
import '../../../core/utils/constant/export_constant.dart';

class ListViewPharmacies extends StatefulWidget {
  const ListViewPharmacies({super.key});

  @override
  State<ListViewPharmacies> createState() => _ListViewPharmaciesState();
}

class _ListViewPharmaciesState extends State<ListViewPharmacies>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    PharmacyControllerImp pharmacyControllerImp =
        Get.find<PharmacyControllerImp>();
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GFSearchBar(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 2),
              padding: const EdgeInsets.all(0),
              searchBoxInputDecoration: InputDecoration(
                contentPadding: const EdgeInsets.all(5),
                border: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'بحث ...',
                suffixIconColor: TColors.grey,
                suffixIcon: Container(
                  padding: const EdgeInsets.all(8),
                  height: 10,
                  width: 10,
                  child: const ImageIcon(
                    AssetImage(AppImageIcon.customSearch),
                    size: TSizes.xs,
                  ),
                ),
              ),
              searchList: pharmacyControllerImp.pharmacies.value
                  .map((element) => element.name)
                  .toList(),
              overlaySearchListItemBuilder: (item) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  color: TColors.secondary,
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              },
              searchQueryBuilder: (String query, List<dynamic> list) {
                return list
                    .where((element) =>
                        element.toLowerCase().contains(query.toLowerCase()))
                    .toList();
              },
              onItemSelected: (item) {
                setState(() {
                  if (kDebugMode) {
                    print('$item');
                  }
                });
              },
            ),
          ),
          Obx(
            () => HandlingDataView(
              statusRequest: pharmacyControllerImp.statusRequest.value,
              widget: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwContainerVert, horizontal: 5),
                itemCount: pharmacyControllerImp.pharmacies.length,
                itemBuilder: (BuildContext context, int index) {
                  if (kDebugMode) {
                    // print(controller.pharmacies.value[index].name);
                  }
                  return PharmacyTileWidget(
                    pharmacy: pharmacyControllerImp.pharmacies.value[index],
                    pharmacyControllerImp: pharmacyControllerImp,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PharmacyTileWidget extends StatelessWidget {
  const PharmacyTileWidget({
    super.key,
    required this.pharmacy,
    required this.pharmacyControllerImp,
  });
  final PharmacyControllerImp pharmacyControllerImp;
  // final int index;
  final Pharmacy pharmacy;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pharmacyControllerImp.goToMainCategoryScreen(pharmacy);
      },
      child: GFListTile(
        avatar: GFAvatar(
          backgroundColor: TColors.primary,
          size: GFSize.SMALL,
          child: CircleAvatar(child: Image.network(pharmacy.image)),
        ),
        padding: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwContainerVert, horizontal: 8),
        margin: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwContainerVert, horizontal: 20),
        color: TColors.white,
        title: Text(
          pharmacy.name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subTitle: Column(
          children: [
            Row(
              children: [
                const ImageIcon(
                  AssetImage(AppImageIcon.location),
                  size: TSizes.iconSm,
                ),
                Text(
                  pharmacy.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: TColors.grey),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  pharmacy.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: TColors.grey),
                ),
              ],
            ),
          ],
        ),
        icon: const Icon(
          Icons.favorite,
          color: TColors.secondary,
        ),
      ),
    );
  }
}
