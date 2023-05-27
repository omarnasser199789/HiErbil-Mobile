import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShareWidget extends StatelessWidget {
  const ShareWidget({Key? key,this.bgColor}) : super(key: key);
  final Color ? bgColor;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color:bgColor?? Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(size.width),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset("assets/svg/share.svg",color: Theme.of(context).canvasColor,),
      ),
    );
  }
}
