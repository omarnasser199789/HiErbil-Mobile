import 'package:flutter/material.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';

class DescriptionWidget extends StatelessWidget {
  final String title;
  final String description;

  DescriptionWidget({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: poppinsSemiBoldTextStyle(fontSize: 16, context: context),
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: poppinsRegularTextStyle(fontSize: 14, context: context),
          ),
        ],
      ),
    );
  }
}
