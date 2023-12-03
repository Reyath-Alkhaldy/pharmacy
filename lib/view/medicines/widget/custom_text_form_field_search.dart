import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';

class CustomTextFormFieldSearch extends StatelessWidget {
  const CustomTextFormFieldSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
     padding: EdgeInsets.symmetric(
                  horizontal: TSizes.spaceBtwItems,
                ),
      child: SearchBar(
        trailing: [
          Icon(
            FontAwesomeIcons.search,
          ),
        ],
        hintText: 'search....',
        padding: MaterialStatePropertyAll(EdgeInsets.all(5.0)),
      ),
    );
  }
}
