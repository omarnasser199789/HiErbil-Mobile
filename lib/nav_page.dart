import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hi_erbil_mobile/features/home/presentation/pages/home_page.dart';
import 'package:hi_erbil_mobile/posts_page.dart';
import 'package:hi_erbil_mobile/features/wishlist/presentation/pages/wishlist_page.dart';
import 'Locale/locale.dart';
import 'Theme/style.dart';
import 'about_page.dart';
import 'core/globals.dart';
import 'core/widgets/double_back_to_close_widget.dart';
import 'features/map/presentation/pages/maps_page.dart';
import 'features/map/presentation/pages/mpa_page.dart';
import 'features/posts/presentation/pages/posts_page.dart';



class NavPage extends StatefulWidget {
  const NavPage({Key? key,this.from}) : super(key: key);
  final int ? from;
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  Timer? timer;
  @override
  void initState() {
    super.initState();


  }








  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return DoubleBackToCloseWidget(
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          animationCurve: Curves.easeInOut,
          key: bottomNavigationKey,
          index: page,
          height: 70, //size.height * 0.086,
          items: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 45,
                  child: SvgPicture.asset(
                    "assets/svg/home.svg",
                    color: (page == 0) ? Colors.white : Colors.grey,
                  ),
                ),
                if (page != 0)
                  Text(
                    locale.home!,
                    maxLines: 1,
                    style: blackBoldTextStyle(context: context,fontSize: 10, color: Colors.grey),
                  ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 45,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset(
                      "assets/svg/posts.svg",
                      color: (page == 1) ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
                if (page != 1)
                  Text(
                    locale.posts!,
                    maxLines: 1,
                    style: blackBoldTextStyle(context: context,fontSize: 10, color: Colors.grey),
                  ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 45,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SvgPicture.asset(
                      "assets/svg/map.svg",
                      color: (page == 2) ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
                if (page != 2)
                  Text(
                    locale.map!,
                    maxLines: 1,
                    style: blackBoldTextStyle(context: context,fontSize: 10, color: Colors.grey),
                  ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 45,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset(
                      "assets/svg/fav.svg",
                      color: (page == 3) ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
                if (page != 3)
                  Text(
                    locale.wishlist!,
                    maxLines: 1,
                    style: blackBoldTextStyle(context: context,fontSize: 10, color: Colors.grey),
                  ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(
                  width: 45,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset(
                      "assets/svg/profile.svg",
                      color: (page == 4) ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
                if (page != 4)
                  Text(
                    "About",
                    maxLines: 1,
                    style: blackBoldTextStyle(context: context,fontSize: 10, color: Colors.grey),
                  ),
              ],
            ),
          ],
          color: Theme.of(context).cardColor,
          backgroundColor: const Color.fromRGBO(236, 82, 82, 0),
             buttonBackgroundColor:Theme.of(context).primaryColor,

          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              lastPage = page;
              page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: buildColumn(page),
      ),
    );
  }
  Set<Marker> markers = Set<Marker>();

  Widget buildColumn(int page) {
    switch (page) {
      case 0:
        return const HomePage();
      case 1:
        return  PostsPage(title: 'Posts');
      case 2:

        return    MapsPage();

        // Marker(
        //   markerId:  MarkerId(""),
        //   infoWindow:  InfoWindow(
        //     title:"i.place.title",
        //   ),
        //   position: LatLng(32,32),
        //   // icon: BitmapDescriptor.fromBytes(markIcons),
        // )
      case 3:
        return  WishlistPage();
      case 4:
        return  AboutPage();

      default:
        return Container();
    }
  }
}
