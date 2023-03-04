import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'core/widgets/custom_text_field.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: 65,
        color: Theme.of(context).cardColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 17,right: 17),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(child: CustomTextField(hint: 'Search', onTap: () {  }, title: '',isSearch: true,)),
                const SizedBox(width: 20,),
                Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(size.width),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset("assets/svg/bill.svg"),
                    )),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
