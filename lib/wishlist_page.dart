import 'package:flutter/material.dart';

import 'core/widgets/app_bar_type3.dart';
import 'global_style.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: appBarWidgetType3("Wishlist", context, true, [], null),
      body: Padding(
        padding: const EdgeInsets.only(top:10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: const GlobalStyle(),
        ),
      ),
    );

  }
}
