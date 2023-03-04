import 'package:flutter/material.dart';

import '../../Locale/locale.dart';
import '../../Theme/style.dart';

class IsCourseWidget extends StatelessWidget {
  const IsCourseWidget({Key? key,required this.isCourse, required this.numberOfCourses}) : super(key: key);

  final bool isCourse;
  final int numberOfCourses;
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Container(
      child:
      (isCourse == false)
          ? Container(
          decoration: BoxDecoration(
            color: kMainColor
                .withOpacity(0.1),
            borderRadius:
            BorderRadius.circular(12),
          ),
          child: Padding(
            padding:
            const EdgeInsets.all(8.0),
            child: Text(
              "  ${"دورات "} $numberOfCourses ",
              style: blackBoldTextStyle(
                  context: context,
                  fontSize: 11,
                  color: kMainColor),
            ),
          ))
          : Container(
          decoration: BoxDecoration(
            color: activeColor
                .withOpacity(0.1),
            borderRadius:
            BorderRadius.circular(12),
          ),
          child: Padding(
            padding:
            const EdgeInsets.all(8.0),
            child: Text(
              "  ${locale.diploma!}  ",
              style: blackBoldTextStyle(
                  context: context,
                  fontSize: 11,
                  color: activeColor),
            ),
          )),
    );
  }
}
