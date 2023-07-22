import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';

import '../../../../Locale/locale.dart';
import '../../../../core/widgets/app_bar_type3.dart';

class AboutHiErbilScreen extends StatelessWidget {
  const AboutHiErbilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: appBarWidgetType3(locale.aboutHiErbil!, context, true, [], null),
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: size.height / 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Hi Erbil',
                style: poppinsSemiBoldTextStyle(fontSize: 18, context: context),
              ),
            ),
            SizedBox(height: size.height / 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'User interface (UI) and user experience (UX) are two words that you might hear mentioned frequently in tech circles (and sometimes interchangeably). But what do the terms actually mean, and what does it mean to be a UX or UI designer?',
                style: poppinsRegularTextStyle(
                    fontSize: 12, context: context, color: iconsColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'UI refers to the screens, buttons, toggles, icons, and other visual elements that you interact with when using a website, app, or other electronic device. UX refers to the entire interaction you have with a product, including how you feel about the interaction. While UI can certainly have an impact on UX, the two are distinct, as are the roles that designers play.',
                style: poppinsRegularTextStyle(
                    fontSize: 12, context: context, color: iconsColor),
              ),
            ),
            SizedBox(height: size.height / 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Sponsors',
                style: poppinsSemiBoldTextStyle(fontSize: 18, context: context),
              ),
            ),
            SizedBox(height: size.height / 30),
            GridView.builder(
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2 / 2.5,
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: const GridViewChildWidget(),
                  ),
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}

class GridViewChildWidget extends StatefulWidget {
  const GridViewChildWidget({
    super.key,
  });

  @override
  State<GridViewChildWidget> createState() => _GridViewChildWidgetState();
}

class _GridViewChildWidgetState extends State<GridViewChildWidget> {
  // Create a variable

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10).copyWith(bottom: 0),
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.1),
                blurRadius: .5,
                spreadRadius: .3),
          ]),
          height: 100,
          width: 100,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/svg/logo.png',
              height: 30,
              width: 30,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
