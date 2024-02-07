import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:new_maps/controller/user/consulation/consultation_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/models/consultation.dart';

class ConsulationScreen extends StatelessWidget {
  const ConsulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConsultationControllerImp());
    return Scaffold(
      appBar: consulationAppBar(context, 'The name'),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => HandlingDataView(
                  statusRequest: controller.statusRequest.value,
                  widget: GroupedListView<Consultation, DateTime>(
                    reverse: true,
                    order: GroupedListOrder.DESC,
                    controller: controller.scrollController,
                    padding: const EdgeInsets.all(8),
                    elements: controller.consultations,
                    groupBy: (consultation) {
                      return DateTime(2024);
                    },
                    groupHeaderBuilder: (consultation) => SizedBox(
                      height: 40,
                      child: Center(
                        child: Card(
                            color: TColors.primary,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                DateFormat.yMMMEd().format(
                                  DateTime.parse(consultation.createdAt),
                                ),
                                style: const TextStyle(color: TColors.white),
                              ),
                            )),
                      ),
                    ),
                    itemBuilder: (BuildContext context, consultation) {
                      return Align(
                        alignment: consultation.type == 'question'
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Card(
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(consultation.text),
                          ),
                        ),
                      );
                    },
                  )),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: TColors.lightGrey,
            ),
            child: const TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: 'Type Your Consultation here'),
            ),
          ),
        ],
      ),
    );
  }

  AppBar consulationAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: TColors.primary,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: GFAppBarTitleBar(
          child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold, fontSize: 15, color: TColors.white),
      )),
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
    );
  }
}
