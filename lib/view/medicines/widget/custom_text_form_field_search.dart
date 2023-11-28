import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFormFieldSearch extends StatelessWidget {
  const CustomTextFormFieldSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
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
