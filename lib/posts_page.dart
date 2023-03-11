import 'package:flutter/material.dart';
import 'Theme/style.dart';
import 'core/widgets/app_bar_type3.dart';
import 'core/widgets/cached_net_work_image.dart';

class PostsPage extends StatelessWidget {
   PostsPage({Key? key}) : super(key: key);
   bool selected=true;

   List<String> tabsTitle=["Latest","Sports","Weather","Arts","Tech","Music"];

   List<Widget> tabs = [];

   @override
   Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
     tabs = [];
     for(var item in tabsTitle){
       tabs.add(  Tab(
         height: 80,
         child: Align(
           alignment:
           Alignment.center,
           child: Column(
             children: [
               SizedBox(
                 width: 50,
                 height: 50,
                 child: CachedNetWorkImage(borderRadius: BorderRadius.circular(10),
                   boxFit: BoxFit.fill,url: null,),
               ),
               Text(item, maxLines: 1),
             ],
           ),
         ),
       ),);
     }


     return Scaffold(
       appBar: appBarWidgetType3("Posts",context,false,[],null),
       body:  Container(
         width: double.infinity,
         decoration: BoxDecoration(
           color: Theme.of(context).cardColor,
           borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
         ),
         child: DefaultTabController(
             length: tabs.length,
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(
                       top: 10, bottom: 10),
                   child: TabBar(
                     isScrollable: true,
                     labelColor: Theme.of(context).canvasColor,
                     unselectedLabelColor: iconsColor,
                     indicatorSize: TabBarIndicatorSize.tab,
                     labelStyle:poppinsRegularTextStyle(fontSize: 12, context: context),
                     tabs: tabs,),
                 ),

                 Container(
                   height: size.height-178,
                   child: TabBarView(children: [

                     Container(),
                     Container(),
                     Container(),
                     Container(),
                     Container(),
                     Container(),
                   ],),
                 ),


               ],
             )


         ),
       ),
     );
   }
}



