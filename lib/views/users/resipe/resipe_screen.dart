import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';

class ResipeScreen extends StatelessWidget {
  const ResipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarResipScreen(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: TColors.primary),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ImageIcon(
                      AssetImage(AppImageIcon.addPhoto),
                      size: 40,
                      color: TColors.primary,
                    ),
                    const Gap(15),
                    Text(
                      'أضف صورة الوصفة أو المنتج الذي تريدة',
                      style: TextStyle(color: TColors.black.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              const Divider(),
              const Text('أو'),
              const Divider(),
              const Gap(20),
              const ImageIcon(
                AssetImage(AppImageIcon.pencil),
                size: 25,
                color: TColors.primary,
              ),
              const Gap(15),
              const Text("أكتب طلبك"),
              const Gap(5),
              Text(
                "أكتب هنا أسم المنتج أو الدواء الذي تريد طلبه من الصيدلية",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColors.black.withOpacity(0.5),
                ),
              ),
              const Gap(20),
              TextFormField(
                // textAlign : TextAlign.center,
                maxLines: 7,
                decoration: InputDecoration(
                  hintText: "مثال : علبة بندول",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const Gap(20),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: TColors.primary,
                    border: Border.all(color: TColors.primary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "التالي",
                    style: TextStyle(color: TColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBarResipScreen() {
    return AppBar(
      centerTitle: true,
      backgroundColor: TColors.primary,
      automaticallyImplyLeading: false,
      toolbarHeight: 40,
      leadingWidth: 50,
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
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
    );
  }
}
