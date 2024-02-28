// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:new_maps/controller/user/pharmacies/pharmacy_paginate_controller.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/pharmacy/widget/pharmacy_title_widget.dart';

class PharmacySearch extends SearchDelegate {
  final PharmacyPaginateControllerImp controller;
  PharmacySearch(
    this.controller,
  );
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('data');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwContainerVert, horizontal: 5),
                itemCount: controller.pharmacies.length,
                itemBuilder: (BuildContext context, int index) {
                  return PharmacyTileWidget(
                    index: index,
                    pharmacyControllerImp: controller,
                  );
                },
              );
  }
}
