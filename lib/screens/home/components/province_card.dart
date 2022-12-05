import 'package:flutter/material.dart';
import 'package:newsapp/constants.dart';

class ProvinceCard extends StatelessWidget {
  final String province;
  const ProvinceCard({Key? key, required this.province}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 4,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        province,
        style: TextStyle(
          color: kTextColor.withOpacity(0.8),
          fontSize: 16,
        ),
      ),

    );
  }
}
