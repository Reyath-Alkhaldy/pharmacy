import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_maps/core/utils/constant/colors.dart';

class CustomTextFormFieldSearch extends StatelessWidget {
  const CustomTextFormFieldSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SearchBar(
     surfaceTintColor: MaterialStatePropertyAll(TColors.primary),
      overlayColor: MaterialStatePropertyAll(TColors.primary),
      // backgroundColor:MaterialStatePropertyAll(TColors.primary) ,
      hintStyle: MaterialStatePropertyAll(TextStyle(color: Colors.black87)),
      textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.black)),
      elevation: MaterialStatePropertyAll(7),
      shadowColor: MaterialStatePropertyAll(Colors.black87),
      trailing: [
        Icon(
          // ignore: deprecated_member_use
          FontAwesomeIcons.search,
        ),
        SizedBox(
          width: 10,
        ),
        // Icon(
        //   FontAwesomeIcons.bars,
        // ),
      ],
      hintText: 'بحث',
    );
  }
}
