import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';

import 'Locale/locale.dart';
import 'core/widgets/custom_text_field.dart';

class HeaderWidget extends StatelessWidget {
   HeaderWidget({Key? key,required this.onFieldSubmitted,required this.controller}) : super(key: key);
  final TextEditingController  controller;
   late Function (dynamic) ? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var locale = AppLocalizations.of(context)!;
    return SafeArea(
      bottom: false,
      child: Container(
        height: 65,
        color: Theme.of(context).cardColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 17,right: 17),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(child: CustomTextField(
                  controller: controller,
                  hint: locale.search!,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: onFieldSubmitted,
                  onTap: () {  }, title: '',isSearch: true,)),


                const SizedBox(width: 20,),
                Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(size.width),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset("assets/svg/bill.svg",color: iconsColor,),
                    )),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
