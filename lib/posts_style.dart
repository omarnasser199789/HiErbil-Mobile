import 'package:flutter/material.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';
import 'core/widgets/cached_net_work_image.dart';


class PostsStyle extends StatelessWidget {

   PostsStyle({Key? key}) : super(key: key);

   List<String> list = ["","",""];
  List<Widget> childrenList = [];

  @override
  Widget build(BuildContext context) {

    for(var item in list){
      childrenList.add(
        Padding(
          padding: const EdgeInsets.only(top:30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height:206,
                child: CachedNetWorkImage(borderRadius: BorderRadius.circular(10),
                  boxFit: BoxFit.fill,url: null,),
              ),

              Padding(
                padding: const EdgeInsets.only(top:8,bottom: 10),
                child: Text("Difference between UX and UI",style: poppinsMediumTextStyle(fontSize: 14, context: context),),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("10 min ago",style: poppinsRegularTextStyle(fontSize: 12, context: context,color: iconsColor),),
                Text("User Name",style: poppinsRegularTextStyle(fontSize: 12, context: context,color: iconsColor),),
              ],),

            ],
          ),
        )
      );


    }

    childrenList.add(const SizedBox(height: 100,));


    final orientation = MediaQuery.of(context).orientation;
    return    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 17,right: 17),
        child: Column(
          children: childrenList,
        ),
      ),
    );
  }
}
