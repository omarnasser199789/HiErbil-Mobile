import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Locale/locale.dart';
import '../../../../Theme/style.dart';
import 'categories_widget.dart';

class WaitingCategoryWidget extends StatelessWidget {
   WaitingCategoryWidget({Key? key}) : super(key: key);

  List<Widget> widgetList = [];
   List<Widget> gridViewList = [];
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    for(int i=0; i<5; i++){
      gridViewList.add(
          Shimmer.fromColors(
            baseColor:Theme.of(context).cardColor,
            highlightColor:  const Color.fromRGBO(119, 118, 118, 0.5490196078431373),
            child: CategoriesListItem(
              title: "*******",
              image:null,
              onTap: (){}),
          ));
    }
    widgetList.add(Text(locale.categories!,style: poppinsSemiBoldTextStyle(fontSize: 15,context: context),));

    widgetList.add(
        Padding(
          padding: const EdgeInsets.only(top: 16,bottom: 16),
          child: GridView.builder(
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 140,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              itemCount: gridViewList.length,
              itemBuilder: (BuildContext context, index){
                return gridViewList[index];
              }
          ),
        )
    );


    return Padding(
      padding: const EdgeInsets.only(top:26,left: 17,right: 17),
      child: SizedBox(
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgetList,
        ),
      ),
    );

  }
}
