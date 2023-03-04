
import 'package:flutter/material.dart';

import '../../Theme/style.dart';

class BackButtonWidget extends StatelessWidget {
   BackButtonWidget({Key? key,this.padding,this.onTap}) : super(key: key);
  final    EdgeInsetsGeometry ? padding;

 final Function () ? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // double h=40;
    // print("h=$h");
    // print(h/size.height);
    // double h1=20;
    // print("h1=$h1");
    // print(h/size.height);
    return      GestureDetector(
      onTap: (onTap==null)? () {
        Navigator.pop(context,400);
      }:onTap,
      //EdgeInsets.only(top: size.height*0.034642857142857144),
      child: Padding(
        padding: (padding==null)? const EdgeInsets.all(8.0):padding!,
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
             color: Theme.of(context).cardColor.withOpacity(1),
            borderRadius: BorderRadius.circular(200),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).canvasColor.withOpacity(0.05),
                spreadRadius: 5,
                blurRadius: 7,
                // offset: Offset(
                //     0, 0), // changes position of shadow
              ),
            ],
          ),
          child:  Icon(
            Icons.arrow_back_ios_outlined,
            color: iconsColor

          ),
        ),
      ),
    );
  }
}
