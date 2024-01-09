// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../../controller/repository/doctors_data.dart';
import '../../../core/utils/constant/export_constant.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
    required this.data,
  });
  final Map data;
  @override
  Widget build(BuildContext context) {
    return   Card(
color: TColors.white,
elevation: 4,
      child: ExpansionTile(

        title: Text( data['title']), 
        subtitle: Text(data['subtitle']),
        leading:  GFAvatar(
              backgroundColor: TColors.primary,
              size: GFSize.SMALL,
              shape: GFAvatarShape.circle,
              child: CircleAvatar(
                  backgroundImage: AssetImage(
              int.parse( data['id']) == 7 ?  doctorsData[int.parse( data['id'])].image:
               doctorsData[3].image,
              )),
            ),
        children:   [
          Text(data['content']),
        ],
      ),
    );
  }
}
