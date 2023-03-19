import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';

import 'core/widgets/app_bar_type3.dart';
import 'core/widgets/app_bar_widget.dart';
import 'core/widgets/product_widget.dart';
import 'global_style.dart';

class ItemList{
ItemList({required this.svg, required this.text});
String svg;
String text;

}

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  List<ItemList> itemList=[
    ItemList(svg: "assets/svg/about.svg",text: "About Hi Erbil"),
    ItemList(svg: "assets/svg/setting.svg",text: "Settings"),
    ItemList(svg: "assets/svg/privacy.svg",text: "Privacy and Policy"),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: appBarWidgetType3("About", context, true, [], null),
      body: Padding(
        padding: const EdgeInsets.only(top:10),
        child: Container(
          width: double.infinity,
          height: size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Container(
                      width: 50,
                      child: Image(image:AssetImage("assets/svg/logo.png"), )),
                ),


                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 17),
                    shrinkWrap: true,
                    gridDelegate:
                    SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 210, //210
                      childAspectRatio:1.3,
                      crossAxisSpacing: 17,
                      mainAxisSpacing: 17,
                    ),
                    itemCount: itemList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(

                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(itemList[index].svg,color: iconsColor,width: 40,),

                            Padding(
                              padding: const EdgeInsets.only(top:10),
                              child: Text(itemList[index].text,style: poppinsRegularTextStyle(fontSize: 12, context: context,color: iconsColor),),
                            ),
                          ],
                        ),
                      );
                    }),

                Padding(
                  padding: const EdgeInsets.only(top:20,bottom:20,left: 30,right: 30),
                  child: Divider(color: iconsColor,),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 70,right: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(size.width)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset("assets/svg/instgram.svg",color: iconsColor,),
                        ),

                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(size.width)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset("assets/svg/facebook.svg",color: iconsColor,),
                        ),

                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(size.width)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset("assets/svg/youtube.svg",color: iconsColor,),
                        ),

                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:17),
                  child: Text("Version 1.1.1 2023",style: poppinsRegularTextStyle(fontSize: 12, context: context,color: iconsColor),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
