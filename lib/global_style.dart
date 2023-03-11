import 'package:flutter/material.dart';
import 'package:hi_erbil_mobile/product_page.dart';

import 'core/widgets/app_bar_widget.dart';
import 'core/widgets/product_widget.dart';

class GlobalStyle extends StatelessWidget {
  const GlobalStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return    SingleChildScrollView(
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(
              left: 17, right: 17, top: 31),
          shrinkWrap: true,
          gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 210, //210
            childAspectRatio:
            (orientation == Orientation.landscape)
                ? 0.83
                : 0.9,
            crossAxisSpacing: 17,
            mainAxisSpacing: 17,
          ),
          itemCount: 100,
          itemBuilder: (BuildContext ctx, index) {
            return ProductWidget(
              enableFav: true,
              title: "Fine Dining",
              onTap: () {
                goTo(
                    context,
                        (context) => const ProductPage(
                      title: "Fine Dining",
                    ));
              },
            );
          }),
    );
  }
}