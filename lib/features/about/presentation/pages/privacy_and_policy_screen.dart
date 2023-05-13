import 'package:flutter/material.dart';

import '../../../../Theme/style.dart';
import '../../../../core/widgets/app_bar_type3.dart';

class PrivacyAndPolicyScreen extends StatelessWidget {
  const PrivacyAndPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBarWidgetType3("Privacy And Policy", context, true, [], null),
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            SizedBox(height: size.height / 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words believable. It is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more ',
                style: poppinsRegularTextStyle(fontSize: 12, context: context, color: iconsColor),
              ),
            ),
            SizedBox(height: size.height / 30),
            listTileOfPrivacyMethod(
                text:
                    'The standard chunk of lorem Ipsum used since  1500s is reproduced below for those interested.',
                context: context,
                size: size),
            const SizedBox(height: 16),
            listTileOfPrivacyMethod(
                text:
                    'Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum. The point of using.',
                context: context,
                size: size),
            const SizedBox(height: 16),
            listTileOfPrivacyMethod(
                text:
                    'Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted.',
                context: context,
                size: size),
            const SizedBox(height: 16),
            listTileOfPrivacyMethod(
                text:
                    'The point of using Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted.',
                context: context,
                size: size),
            SizedBox(height: size.height / 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words believable. It is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a moreIt is a long established fact that reader will.',
                style: poppinsRegularTextStyle(
                    fontSize: 12, context: context, color: iconsColor),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget listTileOfPrivacyMethod({required String text, required BuildContext context, required Size size}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: size.height / 30,
          width: size.width / 30,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color.fromRGBO(52, 168, 175, 1)),
        ),
        SizedBox(width: size.width / 30),
        SizedBox(
          width: 300,
          child: Text(
            text,
            style: poppinsRegularTextStyle(fontSize: 12, context: context),
          ),
        )
      ],
    ),
  );
}
