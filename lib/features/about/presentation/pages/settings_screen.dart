import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';

import '../../../../Locale/language_cubit.dart';
import '../../../../Locale/locale.dart';
import '../../../../core/globals.dart';
import '../../../../core/widgets/app_bar_type3.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class ExpansionPanelItem {
  ExpansionPanelItem({
    required this.headerText,
    required this.body,
    this.isExpanded = true,
  });

  String headerText;
  Widget body;
  bool isExpanded;
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isExpanded = true;
  FocusNode focusNode = new FocusNode();
  late LanguageCubit _languageCubit;
  @override
  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
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

  List<ExpansionPanelItem> _items = [];

  var val ;
  bool theFirst = true;
  @override
  Widget build(BuildContext context) {
    var localee = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    if (theFirst == true) {
      focusNode.requestFocus();
      if(AppLocalizations.of(context)!.locale.toString()=='ar'){
        val=2;
      }else if(AppLocalizations.of(context)!.locale.toString()=='fa'){
        val=3;
      }
      else if(AppLocalizations.of(context)!.locale.toString()=='en'){
        val=4;
      }

      else{
        val=1;
      }

      theFirst = false;
    }

    _items=[];
    // if (_items.isEmpty) {
      _items.add(ExpansionPanelItem(
          headerText: localee.language!,
          body: Column(
            children: [
              LangItems(onTap: () {
                setState(() {
                  val =2 ;
                  globalSH.setString(
                    CACHED_USER_LANGUAGE,
                    'ar',
                  );
                  _languageCubit.selectArabicLanguage();
                });
              }, val: val, title: localee.arabicc!, radioValue: 2,),
              LangItems(onTap: () {
                setState(() {
                  val =3 ;
                  globalSH.setString(
                    CACHED_USER_LANGUAGE,
                    'ku',
                  );
                  _languageCubit.selectKurdishgLanguage();
                });
              }, val: val, title: localee.kurdishh!, radioValue: 3,),
              LangItems(onTap: () {
                setState(() {
                  val =4 ;
                  globalSH.setString(
                    CACHED_USER_LANGUAGE,
                    'en',
                  );
                  _languageCubit.selectEngLanguage();
                });
              }, val: val, title: localee.englishh!, radioValue: 4,),

            ],
          )));

      _items.add(ExpansionPanelItem(
          headerText: localee.darkMode!,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  width: size.width - 34,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      localee.auto!,
                      style: poppinsRegularTextStyle(
                          fontSize: 16, context: context),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  width: size.width - 34,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      localee.darkMode!,
                      style: poppinsRegularTextStyle(
                          fontSize: 16, context: context),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  width: size.width - 34,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      localee.lightMode!,
                      style: poppinsRegularTextStyle(
                          fontSize: 16, context: context),
                    ),
                  ),
                ),
              ),
            ],
          )));

    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: appBarWidgetType3(locale.settings!, context, true, [], null),
      body: Container(
        height: size.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: _isExpanded ? 0.0 : size.height - 100,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ExpansionPanelList(
                      elevation: 0,
                      expandedHeaderPadding: EdgeInsets.all(0),
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _items[index].isExpanded = !isExpanded;
                        });
                      },
                      children:
                          _items.map<ExpansionPanel>((ExpansionPanelItem item) {
                        return ExpansionPanel(
                          canTapOnHeader: true,
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(item.headerText),
                            );
                          },
                          body: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: item.body,
                          ),
                          isExpanded: item.isExpanded,
                        );
                      }).toList(),
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


class LangItems extends StatelessWidget {
   LangItems({Key? key, required this.onTap,required this.val,required this.title,required this.radioValue}) : super(key: key);
  Function () onTap;
  var val;
  final String title;
  final int radioValue;

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return   GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
          width: size.width - 34,
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14,right: 14),
                child: Text(
                  title,
                  style: poppinsRegularTextStyle(
                      fontSize: 16, context: context),
                ),
              ),
              Radio(
                fillColor: MaterialStateColor.resolveWith((states) => Theme.of(context).primaryColor),
                value: radioValue,
                groupValue: val,
                onChanged:(v){},
                activeColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
