import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Theme/style.dart';

class ShowMoreButton extends StatelessWidget {
  const ShowMoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).canvasColor.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child:  Padding(
        padding: EdgeInsets.only(right: 5),
        child: Icon(
          Icons.arrow_forward_ios,
          size: 15,
          color: iconsColor,
        ),
      ),
    );
  }
}
