import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'core/functions.dart';
import 'core/widgets/cached_net_work_image.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class Items{
  Items({required this.image, required this.id});
  String image;
  int id;
}
class _BannerWidgetState extends State<BannerWidget> {
  int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {

    List<Items> list = [
      Items(image: '', id: 1),
      Items(image: '', id: 2)
    ];

    return Padding(
      padding: const EdgeInsets.only(top:26),
      child: Stack(
        children: [
          SizedBox(
            height: 210,
            width: double.infinity,
            child: CarouselSlider(
              items: list.map((e) =>
                  Padding(
                    padding: const EdgeInsets.only(left: 17,right: 17),
                    child: GestureDetector(
                      onTap: ()async{
                        // if (await canLaunch(e.linkUrl)) {
                        //   await launch(e.linkUrl);
                        // } else {
                        //   showMessage(message: "حدث خطا اثناء تنفيذ العملية", context: context);
                        // }
                        // setState(() {
                        //
                        // });

                      },
                      child: CachedNetWorkImage(borderRadius: BorderRadius.circular(10),
                        boxFit: BoxFit.fill,url: null,),
                    ),
                  ),).toList(),

              options: CarouselOptions(
                autoPlay: true,
                enableInfiniteScroll:false,
                viewportFraction:1,
                onPageChanged: (index, reason) {
                  setState(() {
                    selectedIndex = list[index].id;
                  });
                },
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  list
                  .map((e) => AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                duration: const Duration(milliseconds: 200),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                    color: selectedIndex == e.id
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
              ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
