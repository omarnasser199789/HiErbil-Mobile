import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';
import 'package:hi_erbil_mobile/features/about/presentation/pages/about_hi_erbil_screen.dart';
import 'package:hi_erbil_mobile/features/about/presentation/pages/privacy_and_policy_screen.dart';
import 'package:hi_erbil_mobile/features/about/presentation/pages/settings_screen.dart';

import '../../../../Locale/locale.dart';
import '../../../../core/widgets/app_bar_type3.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/product_widget.dart';
import '../../../home/presentation/widgets/global_style.dart';

class ItemList {
  ItemList({required this.svg, required this.text});
  String svg;
  String text;
}

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isExpanded = true;



  List<Widget> navigateList = [
    const AboutHiErbilScreen(),
    const SettingsScreen(),
    const PrivacyAndPolicyScreen()
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    // Delay execution of _toggleContainer by 1 second
    Future.delayed(Duration(milliseconds: 100), () {
      _toggleContainer();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var locale = AppLocalizations.of(context)!;
    List<ItemList> itemList = [
      ItemList(svg: "assets/svg/about.svg", text: locale.aboutHiErbil!),
      ItemList(svg: "assets/svg/setting.svg", text: locale.settings!),
      ItemList(svg: "assets/svg/privacy.svg", text: locale.privacyAndPolicy!),
    ];
    return Scaffold(
      appBar: appBarWidgetType3(locale.about!, context, false, [], null),
      body: Container(
        height: size.height,
        child: Stack(
            alignment: Alignment.bottomCenter,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: _isExpanded ? 0.0 : size.height - 100,
              width: double.infinity,
              // height: size.height,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                          width: 50,
                          child: Image(
                            image: AssetImage("assets/svg/logo.png"),
                          )),
                    ),
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 17),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 210, //210
                          childAspectRatio: 1.3,
                          crossAxisSpacing: 17,
                          mainAxisSpacing: 17,
                        ),
                        itemCount: itemList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return navigateList[index];
                                  }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    itemList[index].svg,
                                    color: iconsColor,
                                    width: 40,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      itemList[index].text,
                                      style: poppinsRegularTextStyle(
                                          fontSize: 12,
                                          context: context,
                                          color: iconsColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 30, right: 30),
                      child: Divider(
                        color: iconsColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70, right: 70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(size.width)),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                "assets/svg/instgram.svg",
                                color: iconsColor,
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(size.width)),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                "assets/svg/facebook.svg",
                                color: iconsColor,
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(size.width)),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                "assets/svg/youtube.svg",
                                color: iconsColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 17),
                      child: Text(
                        "${locale.version!} 1.1.1 2023",
                        style: poppinsRegularTextStyle(
                            fontSize: 12, context: context, color: iconsColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
