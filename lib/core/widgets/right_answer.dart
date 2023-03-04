import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Theme/style.dart';
class RightAnswer extends StatelessWidget {
  const RightAnswer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:6),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/svgs/check2.svg",
            color: percentIndicatorColor,
            width: 15,
          ),

          SizedBox(width: 8,),
          Text("الإجابة الصحيحة ",style: blackBoldTextStyle(fontSize: 12, context: context,color: percentIndicatorColor),),
        ],
      ),
    );
  }
}
