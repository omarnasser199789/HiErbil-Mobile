import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';

import '../../../../core/widgets/app_bar_type3.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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

  List<ExpansionPanelItem> _items = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (_items.isEmpty) {
      _items.add(ExpansionPanelItem(
          headerText: 'Language',
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
                      "English",
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
                      "English",
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
                      "English",
                      style: poppinsRegularTextStyle(
                          fontSize: 16, context: context),
                    ),
                  ),
                ),
              ),
            ],
          )));

      _items.add(ExpansionPanelItem(
          headerText: 'Dark Mode',
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
                      "Auto",
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
                      "Dark Mode",
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
                      "Light Mode",
                      style: poppinsRegularTextStyle(
                          fontSize: 16, context: context),
                    ),
                  ),
                ),
              ),
            ],
          )));
    }

    return Scaffold(
      appBar: appBarWidgetType3("Settings", context, true, [], null),
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
                        print("********");
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
