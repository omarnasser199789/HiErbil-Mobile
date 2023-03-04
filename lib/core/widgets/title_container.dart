import 'package:flutter/cupertino.dart';

import '../../Theme/style.dart';


class TitleContainer extends StatelessWidget {
  const TitleContainer({Key? key,required this.title,required this.color}) : super(key: key);

  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("  $title  ",style: blackBoldTextStyle(context: context,fontSize: 11,color: color),),
        ));
  }
}