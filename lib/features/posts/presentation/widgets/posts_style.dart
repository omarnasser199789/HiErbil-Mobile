import 'package:flutter/material.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';
import '../../../../core/functions.dart';
import '../../../../core/globals.dart';
import '../../../../core/widgets/cached_net_work_image.dart';
import '../../data/models/blog_categories_model.dart';


class PostsStyle extends StatelessWidget {

   PostsStyle({Key? key,required this.posts}) : super(key: key);

   final List<Post> posts;
   // List<String> list = ["","",""];
  List<Widget> childrenList = [];

  @override
  Widget build(BuildContext context) {
    childrenList = [];
    for(var item in posts){
      childrenList.add(
        Padding(
          padding: const EdgeInsets.only(top:30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height:206,
                child: CachedNetWorkImage(borderRadius: BorderRadius.circular(10),
                  boxFit: BoxFit.fill,url:(item.attachments.isNotEmpty)? s3Amazonaws+item.attachments[0].path:null,),
              ),

              Padding(
                padding: const EdgeInsets.only(top:8,bottom: 10),
                child: Text(item.title,style: poppinsMediumTextStyle(fontSize: 14, context: context),),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(getTimeAgo(item.createdAt),style: poppinsRegularTextStyle(fontSize: 12, context: context,color: iconsColor),),
                Text(item.createdByUser.username,style: poppinsRegularTextStyle(fontSize: 12, context: context,color: iconsColor),),
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