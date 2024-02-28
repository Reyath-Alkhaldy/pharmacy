// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:new_maps/controller/user/pharmacies/pharmacy_paginate_controller.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/search/search_delegate.dart';

class SearchDelegateWidget extends StatelessWidget {
  const SearchDelegateWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final PharmacyPaginateControllerImp controller;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(context: context, delegate: PharmacySearch(controller));
      },
      child: Container(
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'بحث ...',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: TColors.darkerGrey),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
      ),
    );
  }
}
